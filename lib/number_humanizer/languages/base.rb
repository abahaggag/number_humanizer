module NumberHumanizer::Languages
  class Base
    attr_reader :result

    def initialize(number, **args)
      @number = number
      @real_part, @fraction_part = exctract_real_and_fraction_parts
      @currency = args[:currency] || NumberHumanizer.currency
      @sub_currency = args[:sub_currency] || NumberHumanizer.sub_currency
    end

    def call
      @result = process_result
      self
    end

    private

    attr_reader :number, :real_part, :fraction_part, :currency, :sub_currency,
                :processed_real_part, :processed_fraction_part

    def exctract_real_and_fraction_parts
      number.abs.to_s.split('.').map(&:to_i)
    end

    def process_result
      @processed_real_part = process_real_part
      @processed_fraction_part = process_fraction_part
      final_result = [
        [processed_real_part, currency].compact.join(' '),
      ]
      final_result << [processed_fraction_part, sub_currency].compact.join(' ') if processed_fraction_part.present?
      final_result.compact.join(decimal_point_connector).insert(0, process_minus)
    end

    def unit(unit_key); self.class::UNITS_DICTIONARY[unit_key]; end
    def word_lookup(segment); self.class::NUMBERS_DICTIONARY[segment]; end
    def and_connector; self.class::AND_CONNECTOR; end
    def decimal_point_connector; self.class::DECIMAL_POINT_CONNECTOR; end
    def minus_word; self.class::Minus_word; end

    def process_minus
      return minus_word if number.negative?
      ''
    end

    def process_real_part
      number_word = word_lookup(real_part)
      return number_word if number_word.present?
      process_number(real_part)
    end

    def process_fraction_part
      return if fraction_part.nil? || fraction_part.zero?
      fraction_part
      # process_number(fraction_part)
    end

    def process_number(number)
      segments = get_number_segments(number)
      segments_size = segments.size
      "#{segments.map!.with_index { |segment, i| process_segment(segment, unit_key: segments_size - i) }.compact.reject{ |sw| sw == '' }.join(and_connector)}"
    end

    def get_number_segments(number)
      return [0] if number.zero?
      segments = []
      while(number != 0)
        segments.insert(0, number % 1000)
        number /= 1000
      end
      segments
    end

    def process_segment(segment, unit_key:)
      word = "#{segment_to_word(segment, unit_key)}"
      word << " #{unit(unit_key)}" if unit_key != 1 && segment > 0
      word.squish!
    end

    def segment_to_word(segment, unit_key)
      return '' if segment.zero? || (segment == 1 && unit_key != 1)
      return word_lookup(segment) if word_lookup(segment).present?
      return process_words_for_tens(segment) if segment < 100
      return process_words_for_hundreds(segment) if segment < 1000
    end

    def process_words_for_tens(segment)
      return word_lookup(segment) if word_lookup(segment).present?
      "#{word_lookup(segment % 10)}#{segment / 10 == 1 ? ' ' : and_connector}#{word_lookup(segment / 10 * 10)}"
    end

    def process_words_for_hundreds(segment)
      word = "#{process_hundred_part(segment)}"
      word << "#{and_connector}#{process_words_for_tens(segment % 100)}" if segment % 100 > 0
      word
    end

    def process_hundred_part(segment)
      hundred_digit = segment / 100
      return '' if hundred_digit.zero?
      (1..2).cover?(hundred_digit) ? word_lookup(hundred_digit * 100) : "#{word_lookup(hundred_digit)} #{word_lookup(100)}"
    end
  end
end

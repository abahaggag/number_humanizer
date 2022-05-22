module NumberHumanizer::Languages
  class Base
    attr_reader :result

    def initialize(number, **args)
      @number = number
      @real_part, @fraction_part = exctract_real_and_fraction_parts
      @currency = args[:currency]
      @sub_currency = args[:sub_currency]
    end

    def call
      @result = process_result
      self
    end

    private

    attr_reader :number, :real_part, :fraction_part, :currency, :sub_currency

    def exctract_real_and_fraction_parts
      number.abs.to_s.split('.').map(&:to_i)
    end
  end
end

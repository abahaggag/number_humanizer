module NumberHumanizer::Languages
  class English < Base
    UNITS_DICTIONARY = {
      1 => '',
      2 => 'thousand',
      3 => 'million',
      4 => 'billion',
      5 => 'trillion',
      6 => 'quadrillion',
      7 => 'quintillion',
      8 => 'sextillion',
      9 => 'septillion',
      10 => 'octillion',
      11 => 'nonillion',
      12 => 'decillion',
      13 => 'undecillion',
      14 => 'duodecillion',
      15 => 'tredecillion',
      16 => 'quattuordecillion',
      17 => 'quindecillion',
      18 => 'sexdecillion',
      19 => 'septemdecillion',
      20 => 'octodecillion',
      21 => 'novemdecillion',
      22 => 'vigintillion'
    }.freeze

    NUMBERS_DICTIONARY = {
      0   => 'zero',
      1   => 'one',
      2   => 'two',
      3   => 'three',
      4   => 'four',
      5   => 'five',
      6   => 'six',
      7   => 'seven',
      8   => 'eight',
      9   => 'nine',
      10  => 'ten',
      11  => 'eleven',
      12  => 'twelve',
      13  => 'thirteen',
      14  => 'fourteen',
      15  => 'fifteen',
      16  => 'sixteen',
      17  => 'seventeen',
      18  => 'eighteen',
      19  => 'nineteen',
      20  => 'twenty',
      30  => 'thirty',
      40  => 'forty',
      50  => 'fifty',
      60  => 'sixty',
      70  => 'seventy',
      80  => 'eighty',
      90  => 'ninety',
      100 => 'hundred',
      200 => 'two hundred'
    }.freeze

    AND_CONNECTOR = " and ".freeze
    DECIMAL_POINT_CONNECTOR = " point ".freeze
    MINUS_WORD = "minus ".freeze

    private

    def process_words_for_hundreds(segment)
      word = "#{process_hundred_part(segment)}"
      word << "#{and_connector}#{process_words_for_tens(segment % 100)}" if segment % 100 > 0
      word
    end

    def process_words_for_tens(segment)
      return word_lookup(segment) if word_lookup(segment).present?
      "#{word_lookup(segment / 10 * 10)} #{word_lookup(segment % 10)}"
    end

    def process_hundred_part(segment)
      hundred_digit = segment / 100
      return '' if hundred_digit.zero?
      (1..2).cover?(hundred_digit) ? word_lookup(hundred_digit * 100) : "#{word_lookup(hundred_digit)} #{word_lookup(100)}"
    end
  end
end

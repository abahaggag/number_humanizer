module NumberHumanizer
  module StringExtensions
    def squish!
      self.strip.gsub(/s+/, ' ')
    end

    def blank?
      self.nil? || self.empty?
    end

    def present?
      !blank?
    end
  end

  module NumericExtensions
    def to_word(**args)
      NumberHumanizer::Manager.new(self, **args).call.result
    end

    def present?
      true
    end
  end

  module NilExtensions
    def present?
      false
    end
  end
end

class String
  include NumberHumanizer::StringExtensions
end

class NilClass
  include NumberHumanizer::NilExtensions
end

class Integer
  include NumberHumanizer::NumericExtensions
end

class Float
  include NumberHumanizer::NumericExtensions
end

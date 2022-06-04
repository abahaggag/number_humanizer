require "number_humanizer/version"
require "number_humanizer/monkey_patchers"
require "number_humanizer/configuration"
require "number_humanizer/languages/base"
require "number_humanizer/languages/arabic"

module NumberHumanizer
  extend NumberHumanizer::Configuration.new(
    language: :arabic,
    currency: nil,
    sub_currency: nil
  )

  def self.setup
    yield self
  end

  class Manager
    attr_reader :result, :number, :language, :args

    def initialize(number, **args)
      @number = number
      @language = args[:language] || NumberHumanizer.language
      @args = args
    end

    def call
      @result = language_service_class.new(number, **args).call.result
      self
    end

    private

    def language_service_class
      @language_service_class ||= \
        case language.downcase.to_sym
        when :arabic, :ar then NumberHumanizer::Languages::Arabic
        else raise(StandardError, "Language specified (#{language}) not supported")
        end
    end
  end
end

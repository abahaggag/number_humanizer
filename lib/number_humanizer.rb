require "number_humanizer/version"
require "number_humanizer/monkey_patchers"
require "number_humanizer/languages/base"
require "number_humanizer/languages/arabic"

module NumberHumanizer
  class Manager
    attr_reader :result, :number, :language, :args

    def initialize(number, language: :arabic, **args)
      @number = number
      @language = language
      @args = args
    end

    def call
      @result = language_service_class.new(number, **args).call.result
      self
    end

    private


    def language_service_class
      @language_service_class ||= \
        case language
        when :arabic, :ar then NumberHumanizer::Languages::Arabic
        else raise(StandardError, 'Language not supported')
        end
    end
  end
end

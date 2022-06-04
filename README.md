# NumberHumanizer

A ruby gem to convert numbers into Arabic words. It has been designed to support multiple languages and currently support only Arabic language.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'number_humanizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install number_humanizer

## Usage

You have two ways to use the gem:

1. Using service class

```ruby
require 'number_humanizer'

NumberHumanizer::Manager.new(1500).call.result
#=> "ألف و خمسة مائة"
```

2. Call monkey patching methods added to Integer and Float classes
```ruby
require 'number_humanizer'

1500.to_word
#=> "ألف و خمسة مائة"
```

Also you can pass currency option as follows:

```ruby
require 'number_humanizer'

NumberHumanizer::Manager.new(1500, currency: 'ريال').call.result
#=> "ألف و خمسة مائة ريال"

1500.to_word(currency: 'ريال')
#=> "ألف و خمسة مائة ريال"
```

Note that sub currency is also supported but not fully functional so if you need to use it then you can pass amount and sub amount separately to the service and you need to combine.

## Configurations
You have to way for setting configurations in number humanizer gem:
- Set configurations globally: this will be used in all conversions. You can add the following snippet in initializers folder or any file that is loaded automatically. Note that this configuration can be changed at any time by calling this code.

```ruby
# initializers/number_humanizer.rb
require 'number_humanizer'

NumberHumanizer.setup do |config|
  # default language is arabic
  config.language = :arabic

  # currency is not set by default and you can set from here
  config.currency = 'ريال'

  # all upcoming configs will be placed here
end
```

- Pass configuratoins instantly whether when using service object or monkey patched methods so that global configurations will be ignored

```ruby
require 'number_humanizer'

NumberHumanizer::Manager.new(1500, language: :arabic, currency: 'ريال').call.result
#=> "ألف و خمسة مائة ريال"

1500.to_word(language: :arabic, currency: 'ريال')
#=> "ألف و خمسة مائة ريال"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abahaggag/number_humanizer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NumberHumanizer project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/number_humanizer/blob/master/CODE_OF_CONDUCT.md).

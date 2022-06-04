lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "number_humanizer/version"

Gem::Specification.new do |spec|
  spec.name          = "number_humanizer"
  spec.version       = NumberHumanizer::VERSION
  spec.authors       = ["Ahmed Ba Haggag"]
  spec.email         = ["ahmedbahaggag@gmail.com"]

  spec.summary       = %q{Number to word humanizer for Arabic Language}
  spec.description   = %q{Number to word humanizer for Arabic Language}
  spec.homepage      = "https://github.com/abahaggag/number_humanizer"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency 'rake', '~> 12.3', '>= 12.3.3'
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"
end

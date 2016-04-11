Gem::Specification.new do |spec|
  spec.name          = "lita-hal-9000"
  spec.version       = "0.2.1"
  spec.authors       = ["Arthur Maltson"]
  spec.email         = ["arthur@maltson.com"]
  spec.description   = "Lita handler to make your bot more like HAL-9000"
  spec.summary       = %q{This is a Lita handler that listens for the
  :unhandled_message event. If the unhandled message is a command to
  the bot, the bot will output a HAL-9000 like message.}
  spec.homepage      = "https://github.com/amaltson/lita-hal-9000"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end

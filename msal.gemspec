# frozen_string_literal: true

require_relative "lib/msal/version"

Gem::Specification.new do |spec|
  spec.name          = "msal"
  spec.version       = Msal::VERSION
  spec.authors       = ["amin-abbasiy"]
  spec.email         = ["uamin.en@gamil.com"]

  spec.summary       = "Authentication library for MS Graph API, Library is under development and not ready to use"
  spec.description   = "Use this library to authenticate with MS Graph API"
  spec.homepage      = "https://amin-abbasi.com/msal"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/amin-abbasiy/msal"
  spec.metadata["changelog_uri"] = "https://github.com/amin-abbasiy/msal/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

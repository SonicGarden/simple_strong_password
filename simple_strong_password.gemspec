require_relative 'lib/simple_strong_password/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_strong_password"
  spec.version       = SimpleStrongPassword::VERSION
  spec.authors       = ["aki77"]
  spec.email         = ["aki77@users.noreply.github.com"]

  spec.summary       = %q{Simple password strength validator.}
  spec.description   = %q{Simple password strength validator.}
  spec.homepage      = "https://github.com/SonicGarden/simple_strong_password"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/SonicGarden/simple_strong_password/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", ">= 6.1.0"
end

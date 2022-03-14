require_relative 'lib/gale_shapley/version'

Gem::Specification.new do |spec|
  spec.name          = "gale_shapley"
  spec.version       = GaleShapley::VERSION
  spec.authors       = ["Akito Hikasa"]
  spec.email         = ["wetsand.wfs@gmail.com"]

  spec.summary       = %q{matching algorithm}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/mrbigass/gale_shapley"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/kakubin/gale_shapley/issues",
    "allowed_push_host" => "TODO: Set to 'http://mygemserver.com'",
    "homepage_uri" => spec.homepage,
    "source_code_uri" => spec.homepage
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = %w(gale_shapley.gemspec) + Dir["*.md", "lib/**/*.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
end

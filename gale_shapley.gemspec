require_relative 'lib/gale_shapley/version'

Gem::Specification.new do |spec|
  spec.name          = 'gale_shapley'
  spec.version       = GaleShapley::VERSION
  spec.authors       = ['Akito Hikasa']
  spec.email         = ['wetsand.wfs@gmail.com']

  spec.summary       = 'stable marriage solver'
  spec.description   = "This gem provide a basic algorithm to solve 'stable marriage problem'"
  spec.homepage      = 'https://github.com/mrbigass/gale_shapley'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/kakubin/gale_shapley/issues',
    'allowed_push_host' => 'https://rubygems.org',
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage
  }

  spec.files         = %w[gale_shapley.gemspec] + Dir['*.md', 'lib/**/*.rb']
  spec.require_paths = ['lib']
end

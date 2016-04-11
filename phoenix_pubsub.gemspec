# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phoenix/pubsub/version'

Gem::Specification.new do |s|
  s.name          = "phoenix_pubsub"
  s.version       = Phoenix::Pubsub::VERSION
  s.authors       = ["Andreas Böhrnsen"]
  s.email         = ["andreas@frontrunner.io"]

  s.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  s.description   = %q{TODO: Write a longer description or delete this line.}
  s.homepage      = "TODO: Put your gem's website or public repo URL here."

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  s.add_dependency 'erlang-etf', '~> 1.1.1'
  s.add_dependency 'redis', '~> 3.0.1'

  s.add_development_dependency 'bundler', '~> 1.9'
  s.add_development_dependency 'rake', '~> 10.0'

  # testing
  s.add_development_dependency 'minitest', '~> 5.8.4'
  s.add_development_dependency 'shoulda-context', '~> 1.2.1'
end

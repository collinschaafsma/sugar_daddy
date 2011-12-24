# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sugar_daddy/version"

Gem::Specification.new do |s|
  s.name        = "sugar_daddy"
  s.version     = SugarDaddy::VERSION
  s.authors     = ["Collin Schaafsma"]
  s.email       = ["collin@quickleft.com"]
  s.homepage    = ""
  s.summary     = %q{OAuth 2 provider for rack based applications}
  s.description = %q{OAuth 2 provider for rack based applications}

  s.rubyforge_project = "sugar_daddy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rack-oauth2', '~> 0.11.0'
  s.add_dependency 'activesupport', '~> 3.1.0'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'activerecord'
  s.add_development_dependency 'sqlite3-ruby'
  s.add_development_dependency 'mongoid', "~> 2.3"
  s.add_development_dependency 'bson_ext', "~> 1.4"

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

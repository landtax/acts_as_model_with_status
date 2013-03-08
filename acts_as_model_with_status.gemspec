# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "acts_as_model_with_status/version"

Gem::Specification.new do |s|
  s.name        = "acts_as_model_with_status"
  s.version     = ActsAsModelWithStatus::VERSION
  s.authors     = ["Santi Bel"]
  s.email       = ["santiago.bel@gmail.com"]
  s.homepage    = "http://github.com/landtax/acts_as_model_with_status"
  s.summary     = %q{Simple status management for Active Record models}
  s.description = %q{Simple status management for Active Record models}

  s.rubyforge_project = "acts_as_model_with_status"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.13"
  s.add_development_dependency "sqlite3", "1.3.7"

  s.add_runtime_dependency "rails", "~> 3.2"
end

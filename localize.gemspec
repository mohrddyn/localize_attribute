$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "localize/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "localize"
  s.version     = Localize::VERSION
  s.authors     = ["Jari Hennilä"]
  s.email       = ["jari.hennila@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Localize."
  s.description = "TODO: Description of Localize."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "rails-i18n", "~> 4.0.4"

  s.add_development_dependency "sqlite3"
end

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "erp/diseases/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "erp_diseases"
  s.version     = Erp::Diseases::VERSION
  s.authors     = ["Hung Nguyen"]
  s.email       = ["hungnt@hoangkhang.com.vn"]
  s.homepage    = "http://globalnaturesoft.com/"
  s.summary     = "Diseases features of website Gwp."
  s.description = "Diseases features of website Gwp."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "erp_core"
  s.add_dependency "deface"
end

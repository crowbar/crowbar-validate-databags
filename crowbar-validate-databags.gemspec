lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "crowbar/validate/databags/version"

Gem::Specification.new do |spec|
  spec.name          = "crowbar-validate-databags"
  spec.version       = Crowbar::Validate::Databags::VERSION
  spec.authors       = ["Itxaka Serrano Garcia", "Rick Salevsky"]
  spec.email         = ["igarcia@suse.com", "rsalevsky@suse.com"]

  spec.summary       = %q{Validates databags of crowbar.}
  spec.homepage      = "http://github.com/crowbar/crowbar-validate-databags"
  spec.license       = "GPL-2.0"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["crowbar-validate-databags"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "kwalify", "~> 0.7"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

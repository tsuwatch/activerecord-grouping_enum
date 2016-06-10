# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/grouping_enum/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-grouping_enum"
  spec.version       = ActiveRecord::GroupingEnum::VERSION
  spec.authors       = ["Tomohiro Suwa"]
  spec.email         = ["neoen.gsn@gmail.com"]

  spec.summary       = %q{Grouping the enum of ActiveRecord}
  spec.description   = %q{Grouping the enum of ActiveRecord}
  spec.homepage      = "https://github.com/tsuwatch/activerecord-grouping_enum"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activerecord', '>=4.1.0'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'rubocop'
end

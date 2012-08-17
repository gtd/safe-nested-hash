# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{safe-nested-hash}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gabe da Silveira"]
  s.date = %q{2009-04-01}
  s.email = %q{gabe@websaviour.com}
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["README.md", "VERSION.yml", "lib/safe_nested_hash.rb", "test/safe_nested_hash_test.rb", "test/test_helper.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/gtd/safe-nested-hash}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Populate deep nested hashes without initialization situps}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

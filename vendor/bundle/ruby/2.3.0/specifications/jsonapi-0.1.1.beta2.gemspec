# -*- encoding: utf-8 -*-
# stub: jsonapi 0.1.1.beta2 ruby lib

Gem::Specification.new do |s|
  s.name = "jsonapi".freeze
  s.version = "0.1.1.beta2"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lucas Hosseini".freeze]
  s.date = "2016-05-17"
  s.description = "Tools for handling JSON API documents".freeze
  s.email = ["lucas.hosseini@gmail.com".freeze]
  s.homepage = "https://github.com/beauby/jsonapi".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.7".freeze
  s.summary = "Parse and validate JSON API documents".freeze

  s.installed_by_version = "2.6.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>.freeze, ["~> 1.8"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
    else
      s.add_dependency(%q<json>.freeze, ["~> 1.8"])
      s.add_dependency(%q<rake>.freeze, [">= 0.9"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    end
  else
    s.add_dependency(%q<json>.freeze, ["~> 1.8"])
    s.add_dependency(%q<rake>.freeze, [">= 0.9"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
  end
end

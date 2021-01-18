# frozen_string_literal: true

require_relative 'lib/megafono/domain/version'

Gem::Specification.new do |spec|
  spec.name        = 'megafono-domain'
  spec.version     = Megafono::Domain::VERSION
  spec.authors     = ['Megafono']
  spec.email       = ['devs@megafono.host']
  spec.homepage    = 'https://megafono.host'
  spec.summary     = 'Megafono apps domains handler'
  spec.description = 'This gem handle with megafono apps domains'
  spec.license     = 'MIT'
  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
end

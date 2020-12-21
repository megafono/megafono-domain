# frozen_string_literal: true

require_relative 'lib/megafono/domain/version'

Gem::Specification.new do |spec|
  spec.name        = 'megafono-domain'
  spec.version     = Megafono::Domain::VERSION
  spec.authors     = ['']
  spec.email       = ['']
  spec.homepage    = ''
  spec.summary     = ''
  spec.description = ''
  spec.license     = 'MIT'
  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
end

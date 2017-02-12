$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'repres/bootstrap/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'repres-bootstrap'
  spec.version     = Repres::Bootstrap::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/repres-bootstrap'
  spec.summary     = 'Repres Bootstrap Resource Presentation Engine Bootstrap 资源表现引擎'
  spec.description = 'Repres (REsource PRESentation) is a series of resource presentation engines. The Bootstrap resource presentation engine includes Bootstrap-based resource presentation templates & snippets. Repres (资源表现)是一系列的资源表现引擎。Bootstrap 资源表现引擎包括基于 Bootstrap 的资源表现模版和片段。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'repres-hyper_text', '~> 1.2'

end

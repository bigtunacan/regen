Gem::Specification.new do |s|
  s.name        = 'regen'
  s.version     = '0.0.3'
  s.date        = '2015-08-30'
  s.summary     = 'Regen'
  s.description = 'Quickly generate project boilerplate so you can get to work.'
  s.authors     = ['Joiey Seeley']
  s.email       = 'joiey.seeley@gmail.com'
  s.files       = ['lib/regen.rb']
  s.executables = ['regen']
  s.homepage    = ''
  s.license     = 'MIT'
  s.add_development_dependency "pry-byebug", [">= 3.2.0"]
  s.add_dependency "json", [">= 1.8.3"]
end

Gem::Specification.new do |s|
  s.name        = 'regen'
  s.version     = '0.0.6'
  s.date        = '2016-02-28'
  s.summary     = 'Regen'
  s.description = 'Quickly generate project boilerplate so you can get to work.'
  s.authors     = ['Joiey Seeley']
  s.email       = 'joiey.seeley@gmail.com'
  s.files       = ['lib/regen.rb']
  s.executables = ['regen']
  s.homepage    = 'https://github.com/bigtunacan/regen.git'
  s.license     = 'MIT'
  s.add_development_dependency "pry-byebug", [">= 3.2.0"]
  s.add_dependency "json", [">= 1.8.3"]
end

require File.dirname(__FILE__) + '/lib/lolrotation/version'

Gem::Specification.new do |s|
  s.name = 'lolrotation'
  s.date = '2012-03-16'
  s.summary = 'League of Legends free champion rotation information'
  s.description = 'Parses the official League of Legends website for information about the currently free champions'
  s.authors = ['Nils Landt']
  s.email = ['lolrotation@promisedlandt.de']
  s.homepage = ''
  s.platform = Gem::Platform::RUBY
  s.require_paths = ['lib']
  s.version = LolRotation::VERSION
  s.add_dependency('nokogiri')
end

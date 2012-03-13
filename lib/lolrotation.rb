if defined?(require_relative)
  def require_lolrotation(path)
    require_relative path
  end
else
  def require_lolrotation(path)
    require "lolrotation/#{path}"
  end
end

require 'nokogiri'
require 'open-uri'
require_lolrotation 'lolrotation/extensions'

module LolRotation
  autoload :VERSION, 'lolrotation/version'
  autoload :Configuration, 'lolrotation/configuration'

  autoload :Rotation, 'lolrotation/rotation'

  def self.configuration
    @configuration ||= LolRotation::Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end
end

ENV['RACK_ENV'] = 'test'

require 'sinatra'
require 'bundler'
Bundler.require

# require testing components
require 'rack/test'
require 'minitest/autorun'

# require application components
Dir.glob('./lib/**/*.rb') { |f| require f }
require './stripe_analyzer'
require 'json'

class BaseSpec < Minitest::Spec
  def expand_path(path)
    File.expand_path(path, __FILE__)
  end

end

class RoutingTests < BaseSpec
  include Rack::Test::Methods

  def app
    StripeAnalyzer
  end
end

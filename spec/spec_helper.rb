ENV['RACK_ENV'] = 'test'

require 'sinatra'
require 'sinatra/activerecord'
require 'bundler'
require 'stripe'
Bundler.require

# require testing components
require 'rack/test'
require 'minitest/autorun'

# require application components
Dir.glob('./lib/**/*.rb') { |f| require f }
require './stripe_analyzer'
require 'json'

# require spec mocks
Dir.glob('./spec/mocks/*.rb') { |f| require f }

Stripe.api_key = ENV['STRIPE_API_KEY']

class BaseSpec < Minitest::Spec
  def expand_path(path)
    File.expand_path(path, __FILE__)
  end

  def app
    StripeAnalyzer
  end
end

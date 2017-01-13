require 'rubygems'
require 'bundler/setup'
require 'dotenv'

Dotenv.load
Bundler.require

Dir.glob('./lib/*.rb') { |f| require f }
require './stripe_analyzer'

run StripeAnalyzer

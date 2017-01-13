require 'rubygems'
require 'bundler/setup'
require 'dotenv'
require 'sass'
require 'sass/plugin/rack'
require 'stripe'

Dotenv.load
Bundler.require
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

Stripe.api_key = ENV['STRIPE_API_KEY']

Dir.glob('./lib/*.rb') { |f| require f }
require './stripe_analyzer'

run StripeAnalyzer

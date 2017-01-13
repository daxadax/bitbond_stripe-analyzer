require 'sinatra'
require 'sinatra/activerecord'

class StripeAnalyzer < Sinatra::Application
  register Sinatra::ActiveRecordExtension
end

require 'sinatra'
require 'sinatra/activerecord'

class StripeAnalyzer < Sinatra::Application
  register Sinatra::ActiveRecordExtension

  get '/' do
    redirect '/connect'
  end

  get '/connect' do
    @stripe_connect_url = stripe_connect_url
    haml :connect
  end

  get '/stripe_callback' do
    auth_code = request['code']
    token = get_stripe_token(auth_code)
    User.save(token)
  end

  private

  def stripe_connect_url
    url = "#{stripe_base_url}/authorize?"
    url += "response_type=code&"
    url += "client_id=#{ENV['STRIPE_CLIENT_ID']}&"
    url += "scope=read_only"
  end

  def get_stripe_token(auth_code)
    url = "#{stripe_base_url}/token"
    data = "client_secret=#{ENV['STRIPE_CLIENT_SECRET']}&"
    data += "code=#{auth_code}&"
    data += 'grant_type=authorization_code'

    `curl -s --data "#{data}" "#{url}"`
  end

  def stripe_base_url
    'https://connect.stripe.com/oauth'
  end
end

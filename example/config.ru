require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-boulderproblems-oauth2'

SCOPE = 'read_products,read_orders,read_customers,write_shipping'

class App < Sinatra::Base
  get '/auth/:provider/callback' do
    <<-HTML
    <html>
    <head>
      <title>Boulder Problems Oauth2</title>
    </head>
    <body>
      <h3>Authorized</h3>
      <p>Token: #{request.env['omniauth.auth']['credentials']['token']}</p>
    </body>
    </html>
    HTML
  end

  get '/auth/failure' do
    <<-HTML
    <html>
    <head>
      <title>Boulder Problems Oauth2</title>
    </head>
    <body>
      <h3>Failed Authorization</h3>
      <p>Message: #{params[:message]}</p>
    </body>
    </html>
    HTML
  end
end

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :boulderproblems, ENV['BOULDERPROBLEMS_API_KEY'], ENV['BOULDERPROBLEMS_SHARED_SECRET'],
           :scope => SCOPE,
           :setup => lambda { |env| params = Rack::Utils.parse_query(env['QUERY_STRING'])
                                    env['omniauth.strategy'].options[:client_options][:site] = "https://#{params['shop']}" }
end

run App.new

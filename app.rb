require "rubygems"
require "bundler"
require "sinatra"
require "instagram"
require "open-uri"
require "./controller"

Bundler.require(:default)

configure do
	enable :sessions
	set :json_encoder, :to_json
	set :erb, :layout => :layout
end
  

before do
  headers["Access-Control-Allow-Methods"] = "GET, POST, PUT, DELETE, OPTIONS"
  headers["Access-Control-Allow-Origin"] = "*"
  headers["Access-Control-Allow-Headers"] = "accept, authorization, origin"
end

options "*" do
  response.headers["Allow"] = "HEAD,GET,PUT,DELETE,OPTIONS,POST"
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
end

	

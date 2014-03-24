require "sinatra"
require "instagram"

enable :sessions

CALLBACK_URL = "http://morning-sands-2794.herokuapp.com/oauth/callback"

Instagram.configure do |config|
  config.client_id = "435d7cd451364d44bd0138b2a29e588f"
  config.client_secret = "f57df2f3e4294ece8c60b224c18c86d9"
end

get "/" do
  erb :index
end

get "/oauth/connect" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  redirect "/feed"
end

get "/feed" do
	
  @client = Instagram.client(:access_token => session[:access_token])
  @user = @client.user
  @media_item = @client.user_recent_media.first(9)
  boost = "@media_item.images.low_resolution.url"
  erb :feed

end

require "uri"
require "net/http"

require 'base64'
require_relative '../../tokens_and_keys.rb'

class ArtistsController < ApplicationController
  before_action :authorized, except: [:index]

  def index
    @artists = Artist.all
  end

  def show
    @user = User.find_by(user_name: session[:user_name])
    @artist = Artist.find(params[:id])
  end

  def new
    #load the form
    @artist = Artist.new
      
      #easy
        #generate a new Authentication Token

    url = URI("https://accounts.spotify.com/api/token")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
      
    client = Base64.strict_encode64($API_CLIENT_ID).gsub!("=", "6")
    secret = Base64.strict_encode64($API_CLIENT_SECRET)
    encoding = client + secret

    a_request = Net::HTTP::Post.new(url)
    a_request["Authorization"] = "Basic #{encoding}"
    a_request["Content-Type"] = "application/x-www-form-urlencoded"
    a_request["Cookie"] = "__Host-device_id=AQAPKQDyKW4K44mlfR05wi1HY7zoU9jc-zm1FsKtFDbwQJIPW__Po34ROwHzi7AQlojZ1AAvKlRcKEBrCoG4dGHlusScPopF7lQ"
    a_request.body = "grant_type=client_credentials"

    access_response = https.request(a_request)

    data = JSON.parse(access_response.read_body)

    @access = data["access_token"]
    
      # harder
        # is the token valid? 
  end
  
  def create
    
    artist_name = params[:artist][:name]
    access = params[:artist][:access]
    
    # artist_name = params[:name]
    # sanitize name
    if artist_name.include?(" ")
      artist_name.gsub!(" ", "%20").strip!
    end
    
    #the api stuff
    # call the api 
    api_url = URI("https://api.spotify.com/v1/search?q=#{artist_name}&type=artist")
    
    https = Net::HTTP.new(api_url.host, api_url.port);
    https.use_ssl = true
    
    # artist_name into the url with the access token
    api_request = Net::HTTP::Get.new(api_url)
    api_request["Authorization"] = "Bearer #{access}"
    
    response = https.request(api_request)
    
    data = JSON.parse(response.read_body)
    
    #create artist

    artist = Artist.new(artist_params(:name))
    
    artist[:s_id] = data["artists"]["items"][0]["id"]
    artist[:s_image_url] = data["artists"]["items"][0]["images"][0]["url"]
    artist[:name] = data["artists"]["items"][0]["name"]
    artist[:s_uri] = data["artists"]["items"][0]["uri"]
    
    # images_array = data["artists"]["items"][0]["images"]
    # genres_array = data["artists"]["items"][0]["genres"]

    artist.save 

    redirect_to artist_path(artist)

  end

  private 

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end

end

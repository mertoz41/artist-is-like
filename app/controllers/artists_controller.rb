require 'rest-client'

class ArtistsController < ApplicationController
  before_action :authorized, except: [:index]

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    #load the form
    @artist = Artist.new
      
      #easy
        #generate a new Authentication Token
    access_url = 'https://accounts.spotify.com/api/token'


    response = RestClient::Request.execute(method: :post, url: access_url, 
                headers: {"Content-Type": "application/x-www-form-urlencoded", 
                          "Authorization": "Basic <base64 encoded #{CLIENT_ID}:#{CLIENT_SECRET}>"},
                body: {"grant_type": "client_credentials"})

    data = JSON.parse(response)

    byebug
      # harder
        # is the token valid? 
  end
  
  def create
    #the api stuff
    # artist_name = params[:name]

    # call the api 

    # artist_name into the url with the access token

  end


end

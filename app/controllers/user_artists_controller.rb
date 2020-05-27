class UserArtistsController < ApplicationController
  def new
  end

  def create
    
    artist = Artist.find(params["format"].to_i)
    user = User.find_by(user_name: session[:user_name])
    follow = UserArtist.create(user_id: user.id, artist_id: artist.id)
    redirect_to artist_path(artist.id)
  end 
end

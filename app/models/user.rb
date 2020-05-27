class User < ApplicationRecord
    has_secure_password
    # Artist relationships
    has_many :user_artists
    has_many :artists, through: :user_artists

    #Is_Like relationships
    has_many :comments
    has_many :is_likes, through: :comments

    #validation
    validates :user_name, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def follows_artist?(artist_id)
        self.user_artists.each do |art|
            if art.artist_id == artist_id
                return true
            end 
        end 
        return false
    end 
end

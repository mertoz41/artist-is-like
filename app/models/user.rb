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
end

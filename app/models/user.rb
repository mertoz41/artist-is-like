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

    def self.top_user
        hash = {}

        User.all.each do |user|
            hash[user.user_name] = user.artists.count
        end 
        top = hash.sort_by{|k, v| -v }
        return top.first 
    end 

    def full_name
        return "#{self.first_name} #{self.last_name}"
    end 

    def last_name_initial
        last_name = self.last_name
        return "#{self.first_name} #{last_name[0].capitalize}."
    end 

    def self.count_users
        User.all.count 
    end 

    def count_comments
        self.comments.count
    end 

    def self.newest_user
        User.last 
    end

    def self.rank_user
        hash = {}
        num = 0 
        User.all.each do |user| 
            hash[user.user_name] = user.is_likes.count
        end 

        rank = hash.sort_by{|k, v| -v } 
        ranked = rank.map do |k, v|
            num += 1 
            puts "#{num}. #{k}: (#{v})"
        end
        return ranked 
    end 
end

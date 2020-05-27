class Artist < ApplicationRecord
    has_many :user_artists
    has_many :users, through: :user_artists


    has_many :influenced_by, class_name: "IsLike", foreign_key: :liker_id, dependent: :destroy
    has_many :likeds, through: :influenced_by, source: :liked 
    has_many :influenced, class_name: "IsLike", foreign_key: :liked_id, dependent: :destroy
    has_many :likers, through: :influenced, source: :liker


    def self.most_influential 
        hash = {}
        
        Artist.all.each do |art|
            hash[art.name] = art.likers.count 
        end
        most_influential = hash.sort_by{|k, v| v }.last
        return most_influential  
       
    end 

    def self.most_influenced 
        hash = {}
        
        Artist.all.each do |art|
            hash[art.name] = art.likeds.count 
        end
        most_influenced = hash.sort_by{|k, v| v }.last
        return most_influenced  
       
    end 
end

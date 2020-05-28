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
        most_influenced = hash
        return most_influenced  
       
    end 

    def self.most_original
        hash = {}
        
        Artist.all.each do |art|
            hash[art.name] = art.likeds.count 
        end
        least_influenced = hash.sort_by{|k, v| v }.first
        return least_influenced  
    end

    def self.least_influential
        hash = {}
        
        Artist.all.each do |art|
            hash[art.name] = art.likers.count 
        end
        most_influential = hash.sort_by{|k, v| v }.first
        return most_influential  
    end

    def self.average_influences
  
        influences_array = Artist.all.map { |art| art.likeds.count }
        return influences_array.sum(0.0) / influences_array.length  

    end

    def self.total_artists
        return Artist.all.count
    end

    def self.most_followed
        hash = {}
        
        Artist.all.each do |art|
            hash[art.name] = art.user_artists.count 
        end
        most_followed = hash.sort_by{|k, v| v }.last
        return most_followed  
    end



    private


end

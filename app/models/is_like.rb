class IsLike < ApplicationRecord

    #self join Artist Relationship
    belongs_to :liker, class_name: "Artist", foreign_key: :liker_id
    belongs_to :liked, class_name: "Artist", foreign_key: :liked_id 


    #User relationships

    has_many :comments
    has_many :users, through: :comments


    def self.count
        self.all.count
    end

    def self.most_recent
        liked_object = Artist.find(self.all.last.liked_id)
        liker_object = Artist.find(self.all.last.liker_id)
         return "#{liker_object.name} is Like #{liked_object.name}"
    end
    

end

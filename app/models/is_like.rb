class IsLike < ApplicationRecord

    #self join Artist Relationship
    belongs_to :liker, class_name: "Artist", foreign_key: :liker_id
    belongs_to :liked, class_name: "Artist", foreign_key: :liked_id 


    #User relationships

    has_many :comments
    has_many :users, through: :comments


    def self.islike_count
        self.all.count
    end

    def self.most_recent
        is_like = self.last
        # liked_object = Artist.find(self.all.last.liked_id)
        # liker_object = Artist.find(self.all.last.liker_id)
         return "#{is_like.liker.name} is Like #{is_like.liked.name}"
    end
    

end

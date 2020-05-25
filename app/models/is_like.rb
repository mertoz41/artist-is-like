class IsLike < ApplicationRecord

    #self join Artist Relationship
    belongs_to :liker, class_name: "Artist", foreign_key: :liker_id
    belongs_to :liked, class_name: "Artist", foreign_key: :liked_id 


    #User relationships

    has_many :comments
    has_many :users, through: :comments

end

class Artist < ApplicationRecord
    has_many :user_artists
    has_many :users, through: :user_artists


    has_many :influenced_by, class_name: "IsLike", foreign_key: :liker_id, dependent: :destroy
    has_many :likeds, through: :influenced_by, source: :liked 
    has_many :influenced, class_name: "IsLike", foreign_key: :liked_id, dependent: :destroy
    has_many :likers, through: :influenced, source: :liker
end

class IsLike < ApplicationRecord
    belongs_to :liker, class_name: "Artist", foreign_key: :liker_id
    belongs_to :liked, class_name: "Artist", foreign_key: :liked_id 

end

class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :is_like


    def self.ids_and_counts
        comment_count = Hash.new(0)
        self.all.each {|comment| comment_count[comment.user_id] += 1}
        return comment_count
    end

    def self.top_commenter_count
        self.ids_and_counts.sort_by{|k, v| v }.last[1]
    end

    def self.top_commenter
        comment_array = self.ids_and_counts.sort_by{|k, v| v }.last
        return User.find(comment_array[0]).user_name
    end

    def self.most_recent_comment_objects(amount)
       recent =  self.all.max(amount) {|a, b| a.updated_at <=> b.updated_at } 
    end

    def self.most_recent_comment_bodies(amount)
        object = self.most_recent_comment_objects(amount)
            object.map do |body|
            body.comment_body
            end
     end

     def self.most_recent_comments_dates(amount)
       object =  self.most_recent_comment_objects(amount)
         object.map do |body|
         body.updated_at.strftime("%m/%d/%Y")
        end
     end

     def self.most_recent(amount)
        object =  self.most_recent_comment_objects(amount)
          object.each do |body|
          return "Date Posted: #{body.updated_at.strftime("%m/%d/%Y")} || Comment: #{body.comment_body}"
        end
     end

    def self.recent_one
        object =  self.most_recent_comment_objects(1)
        object.each do |body|
         return "Date Posted: #{body.updated_at.strftime("%m/%d/%Y")} || Comment: #{body.comment_body}"
        end
     end

    def self.most_talked_about
        comment_count = Hash.new(0)
        self.all.each {|comment| comment_count[comment.is_like_id] += 1}
        is_like_id = comment_count.sort_by{|k, v| v }.last[0]
          is_like_object = IsLike.find(is_like_id)
          liked_object = Artist.find(is_like_object.liked_id)
          liker_object = Artist.find(is_like_object.liker_id)
         return "#{liker_object.name} is Like #{liked_object.name}"
    end

end

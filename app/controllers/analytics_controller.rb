class AnalyticsController < ApplicationController
  
  def index
    #for Users:
    @top_user = User.top_user
    @num_users = User.count_users
    @last_user = User.newest_user.user_name
    @rank_list = User.rank_user
    #for comments:
    @most_recent_three_comment = Comment.most_recent(3)
    @most_talked_about = Comment.most_talked_about
    @most_recent_comment = Comment.recent_one
    @top_commenter = Comment.top_commenter
    @recent_comment_body = Comment.most_recent_comment_bodies(1)
    @recent_comment_date = Comment.most_recent_comments_dates(1)
    #artists
    @influential_artist = Artist.most_influential 
    @influenced_artist = Artist.most_influential 
    @most_original = Artist.most_original
    @least_influential = Artist.least_influential
    @average_influences = Artist.average_influences
    @total_artists = Artist.total_artists
    @most_followed = Artist.most_followed

    #is_likes
     @most_recent = IsLike.most_recent
     @islike_count = IsLike.count
  end
end

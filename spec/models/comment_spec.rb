require 'rails_helper'

RSpec.describe Comment, type: :model do
let(:user_one) do 
    {   first_name: "Michael Jackson",
        last_name: "sfnvdjfnva",
        user_name: "jfnsjnrsjnf",
        password: "kdngksjrnw"
    }
        end
let(:artist_one) do 
    {   name: "Michael Jackson",
        s_id: "sfnvdjfnva",
        s_image_url: "jfnsjnrsjnf",
        s_uri: "kdngksjrnw"
        }
        end  
let(:artist_two) do 
    {   name: "Michael Jackson",
        s_id: "sfnvdjfnva",
        s_image_url: "jfnsjnrsjnf",
        s_uri: "kdngksjrnw"
        }
        end  
let(:is_like_one) do
        artist1 = Artist.create(artist_one)
        artist2 = Artist.create(artist_two)
        {   liker_id: artist1.id,
            liked_id: artist2.id
        }
        end
let(:attributes) do
    user1 = User.create(user_one)
    is_like1 = IsLike.create(is_like_one)
    {   user_id: user1.id,
        is_like_id: is_like1.id,
        comment_body: "aknsdansd"
        }
        end  
                      
    it "is considered valid" do    
        expect(Comment.new(attributes)).to be_valid
        end

        it "most recent comment" do  
            old_comment = Comment.create(attributes)
            new_comment = Comment.create(attributes)
          expect(Comment.recent_one).to eq("Date Posted: #{new_comment.updated_at.strftime("%m/%d/%Y")} || \n Comment: #{new_comment.comment_body}")
          end
end
require 'rails_helper'

RSpec.describe IsLike, type: :model do
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
    let(:attributes) do
        artist1 = Artist.create(artist_one)
        artist2 = Artist.create(artist_two)
        {   liker_id: artist1.id,
            liked_id: artist2.id
            }
            end  
                          
        it "is considered valid" do    
            expect(IsLike.new(attributes)).to be_valid
            end
         
        
        it "IsLike Count" do  
            first_islike = IsLike.create(attributes)
            second_islike = IsLike.create(attributes)
            expect(IsLike.islike_count).to eq(2)
            end

        it "most recent is like" do  
            first_islike = IsLike.create(attributes)
            second_islike = IsLike.create(attributes)
            expect(IsLike.most_recent).to eq("#{second_islike.liker.name} is Like #{second_islike.liked.name}")
            end

end
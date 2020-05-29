require 'rails_helper'

RSpec.describe User, type: :model do
    let(:attributes) do 
        {   first_name: "Michael",
            last_name: "Jackson",
            user_name: "Mikejack",
            password: "kdngksjrnw"
            }
            end  
                          
        it "is considered valid" do    
            expect(User.new(attributes)).to be_valid
            end
        
                                
        it "It gives the count of users" do   
            User.create(attributes) 
            expect(User.count_users).to eq(1) 
            end

        it "is considered valid" do   
            new_user = User.create(attributes) 
                expect(User.newest_user).to eq(new_user) 
                end
            

end
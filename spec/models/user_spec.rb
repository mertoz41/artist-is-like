require 'rails_helper'

RSpec.describe User, type: :model do
    let(:attributes) do {   
            first_name: "Michael",
            last_name: "Jackson",
            user_name: "Mikejack",
            password: "kdngksjrnw"
            }
            end  
                          
        it "is considered valid" do    
            expect(User.new(attributes)).to be_valid
            end
        

        # it "is not valid without a first_name" do
        #     User.first_name = nil 
        #     expect(User).to_not be_valid
        # end 
        
                                
        it "It gives the count of users" do   
            User.create(attributes) 
            expect(User.count_users).to eq(1) 
            end

        it "is considered valid" do   
            new_user = User.create(attributes) 
                expect(User.newest_user).to eq(new_user) 
                end

        it "user full name" do
            user = User.create(attributes)
            expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
        end 

        it "user last_name initial" do
            user = User.create(attributes)
            expect(user.last_name_initial).to eq("#{user.first_name} #{user.last_name[0].capitalize}.")
        end 
        
        it "user comment count" do
            user = User.create(attributes)
            expect(user.count_comments).to eq(0)
        end 

        

            

end
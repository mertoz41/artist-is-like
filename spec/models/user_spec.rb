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
end
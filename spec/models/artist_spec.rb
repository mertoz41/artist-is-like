# require_relative './app/models/artist.rb'
require 'rails_helper'

RSpec.describe Artist, type: :model do
    let(:attributes) do 
        {   name: "Michael Jackson",
            s_id: "sfnvdjfnva",
            s_image_url: "jfnsjnrsjnf",
            s_uri: "kdngksjrnw"
            }
            end  
                          
        it "is considered valid" do    
            expect(Artist.new(attributes)).to be_valid
            end
end
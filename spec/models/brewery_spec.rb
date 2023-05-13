require 'rails_helper'

RSpec.describe Brewery, type: :model do
  describe "relationships" do
    it { should have_many :beers }
  end

#   #User Story 5
#   describe "instance methods" do
#     it '#' do
     
#     end
#   end
# end
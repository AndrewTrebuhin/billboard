require 'spec_helper'

RSpec.describe User, :type => :model do

  it "has a valid factory" do
    user = FactoryGirl.create(:user)
    expect(user).to be_valid
  end

  it "has boards" do
    user = FactoryGirl.create(:user_with_boards)
    expect(user.boards.count).to be >= 1
  end
end #Ofuser
require 'spec_helper'

RSpec.describe Board, :type => :model do

  it "has a valid factory" do
    board = FactoryGirl.create(:board_with_new_user)
    expect(board).to be_valid
  end
end
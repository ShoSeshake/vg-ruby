require 'rails_helper'
describe Relationship do
  describe '#create' do
    # it "is valid with a follower_id, following_id" do
    #   relationship = build(:relationship)
    #   expect(relationship).to be_valid
    # end

    it "is invalid without a following_id" do
      relationship = build(:relationship, following_id: nil)
      relationship.valid?
      expect(relationship.errors[:following_id]).to include("can't be blank")
    end

    it "is invalid without a follower_id" do
      relationship = build(:relationship, follower_id: nil)
      relationship.valid?
      expect(relationship.errors[:follower_id]).to include("can't be blank")
    end
  end
end
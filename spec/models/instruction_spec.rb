require 'rails_helper'
describe Instruction do
  describe '#create' do
    it "is valid with a text, position" do
      instruction = build(:instruction)
      expect(instruction).to be_valid
    end

    it "is valid with a text, without an position" do
      instruction = build(:instruction, position: nil)
      instruction.valid?
      expect(instruction.errors[:position]).to include("can't be blank")
    end

    it "is valid with an position, without a text" do
      instruction = build(:instruction, text: nil)
      instruction.valid?
      expect(instruction.errors[:text]).to include("can't be blank")
    end

    it "is invalid without a recipe" do
      instruction = build(:instruction, recipe: nil)
      instruction.valid?
      expect(instruction.errors[:recipe]).to include("must exist")
    end
  end
end
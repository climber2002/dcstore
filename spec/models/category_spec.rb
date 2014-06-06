require 'spec_helper'

describe Category do

  describe "Validation" do
    it "should be able to create a category with a valid name" do
      category = Category.create(name: "category1")
      expect(category).to be_valid
    end

    it "should be invalid if the name already exists" do
      audio_category = FactoryGirl.create(:category_audio)

      expect(Category.create(name: audio_category.name)).to be_invalid
    end

    it "should be invalid if the name is empty" do
      expect(Category.create(name: "   ")).to be_invalid
    end

    it "should be invalid if the name is nil" do
      expect(Category.create(name: nil)).to be_invalid
    end
  end
end
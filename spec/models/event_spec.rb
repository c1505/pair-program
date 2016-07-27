require 'rails_helper'

describe Event do
  it "has a valid factory" do
    expect(FactoryGirl.build(:event)).to be_valid
  end

  it "is invalid without start dates" do
    expect(FactoryGirl.build(:event, earliest_start: nil)).to_not be_valid
  end

  it "is valid with a repo link"
  it "is invalid without a repo link"

  it "is valid with a host"
  it "is invalid without a host"

end


  # it "is valid with a title if exercism"

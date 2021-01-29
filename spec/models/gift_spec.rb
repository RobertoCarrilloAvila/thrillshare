require 'rails_helper'

RSpec.describe Gift, type: :model do
  
	subject{
  	create(:gift)
  }

  it "is valid" do
  	expect(subject).to be_valid
  end

  it "is not valid without order" do
		subject.order = nil
		expect(subject).to_not be_valid
	end

  it "is not valid without kind" do
    subject.kind = nil
    expect(subject).to_not be_valid
  end

  it "is valid without size" do
    subject.kind = "mug"
    subject.size = nil
    expect(subject).to be_valid
  end

  it "is not valid without size" do
    subject.kind = "tshirt"
    subject.size = nil
    expect(subject).to_not be_valid
  end

end

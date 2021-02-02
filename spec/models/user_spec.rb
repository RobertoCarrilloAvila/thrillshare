require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject{
  	build(:user)
  }

  it "is valid" do
  	expect(subject).to be_valid
  end

  it "is not valid without email" do
		subject.email = nil
		expect(subject).to_not be_valid
	end

	it "is not valid without password" do
		subject.password = nil
		expect(subject).to_not be_valid
	end

end

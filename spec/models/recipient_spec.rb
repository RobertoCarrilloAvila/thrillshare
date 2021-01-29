require 'rails_helper'

RSpec.describe Recipient, type: :model do
  
  subject{
  	create(:recipient)
  }

  it "is valid" do
  	expect(subject).to be_valid
  end

  it "is not valid without name" do
		subject.name = nil
		expect(subject).to_not be_valid
	end

	it "is not valid without last_name" do
		subject.last_name = nil
		expect(subject).to_not be_valid
	end

	describe "email" do
		it "is not valid without email" do
			subject.email = nil
			expect(subject).to_not be_valid
		end

		it "is not valid email format" do
			subject.email = "test"
			expect(subject).to_not be_valid
		end
	end

	it "is not valid without address" do
		subject.address = nil
		expect(subject).to_not be_valid
	end

	it "is not valid without order" do
		subject.order = nil
		expect(subject).to_not be_valid
	end

end

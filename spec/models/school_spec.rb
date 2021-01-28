require 'rails_helper'

RSpec.describe School, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject{
  	create(:school)
  }

  it "is valid" do
  	expect(subject).to be_valid
  end

	it "is not valid without name" do
		subject.name = nil
		expect(subject).to_not be_valid
	end

	it "is not valid without address" do
		subject.address = nil
		expect(subject).to_not be_valid
	end

end

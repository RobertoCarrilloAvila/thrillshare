require 'rails_helper'

RSpec.describe Address, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "is valid" do
  	address = create(:address)
  	expect(address).to be_valid
  end

	it "is not valid without state" do
		address = build(:address, state: nil)
		expect(address).to_not be_valid
	end

	it "is not valid without zip_code" do
		address = build(:address, zip_code: nil)
		expect(address).to_not be_valid
	end

	it "is not valid without city" do
		address = build(:address, city: nil)
		expect(address).to_not be_valid
	end

	it "is not valid without street" do
		address = build(:address, street: nil)
		expect(address).to_not be_valid
	end

end

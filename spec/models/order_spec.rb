require 'rails_helper'

RSpec.describe Order, type: :model do
  
  subject{
  	create(:order)
  }

  it "is valid" do
  	expect(subject).to be_valid
  end

  it "is not valid without school" do
		subject.school = nil
		expect(subject).to_not be_valid
	end

  it "is not valid without status" do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without notify" do
    subject.notify = nil
    expect(subject).to_not be_valid
  end

end

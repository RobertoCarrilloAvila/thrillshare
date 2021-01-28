require 'rails_helper'

RSpec.describe Order, type: :model do
  
  subject{
  	debugger
  	create(:order)
  }

  it "is valid" do
  	expect(subject).to be_valid
  end

  it "is not valid without school" do
		subject.school = nil
		expect(subject).to_not be_valid
	end

end

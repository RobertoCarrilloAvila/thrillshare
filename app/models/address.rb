class Address < ApplicationRecord

	has_one :school
	
	validates :state, :zip_code, :city, :street, presence: true

end

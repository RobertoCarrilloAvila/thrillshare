class Address < ApplicationRecord

	validates :state, :zip_code, :city, :street, presence: true

end

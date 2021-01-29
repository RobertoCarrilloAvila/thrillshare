class Recipient < ApplicationRecord
  
	EMAIL_FORMAT = /\A[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\z/

  belongs_to :address
  belongs_to :order

  validates :name, :last_name, :email, :address, :order, presence: true
  validates :email, format: {with: EMAIL_FORMAT, message: "Invalid email format"}

end

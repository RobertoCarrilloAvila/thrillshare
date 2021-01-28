class School < ApplicationRecord
  
  belongs_to :address
  has_many :orders

  validates :name, :address, presence: true
  
end

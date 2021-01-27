class School < ApplicationRecord
  
  belongs_to :address

  validates :name, :address, presence: true
  
end

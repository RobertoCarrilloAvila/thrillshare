class Order < ApplicationRecord
  
  STATUSES = {
		received:   0,
	  processing: 1,
		shipped:    2,
		cancelled:  3
  }.freeze

  enum status: STATUSES

  belongs_to :school

  # accepts_nested_attributes_for :gifts

  validates :school, :status, presence: true

end

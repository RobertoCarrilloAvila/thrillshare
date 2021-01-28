class Gift < ApplicationRecord
  
	KINDS = {
		mug:     0,
		tshirt: 1,
		hoodie:  2,
		sticker: 3
	}.freeze

	enum kind: KINDS

  belongs_to :order

  validates :order, :kind, presence: true
  validates :size, presence: true, if: -> {["tshirt", "hoodie"].include?(kind)}

end

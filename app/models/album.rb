class Album < ApplicationRecord

	# ========association ======
	has_many :images
	belong_to :user

	accepts_nested_attributes_for :images

	# ========validation======
	validates :title, presence: :true
end

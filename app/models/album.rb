class Album < ApplicationRecord

	# ========association ======
	has_many :images
	belongs_to :user

	accepts_nested_attributes_for :images, allow_destroy: true

	# ========validation======
	validates :name, presence: :true

	def first_image_url
		images.first.img.try(:url)
	end
end

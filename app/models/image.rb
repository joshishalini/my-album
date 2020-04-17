class Image < ApplicationRecord
	belongs_to :album
	has_attached_file :img
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
  validates :tag_line, :img, presence: :true

  before_save :limit_images

	def limit_images
		if album.images.count < 25
			raise ActiveRecord::Rollback
			self.errors.add(:base, 'Not more then 25 images allowed.') 
  	end
	end

  def user_email
  	album.user.email
  end
end

class Image < ApplicationRecord
	belongs_to :album
	has_attached_file :img
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
  validates :tag_line, :img, presence: :true

  def user_email
  	album.user.email  	
  end
end

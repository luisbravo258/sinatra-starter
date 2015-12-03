require './uploader/images_uploader'

class Image < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImagesUploader
end

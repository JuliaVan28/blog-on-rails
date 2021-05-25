class Post < ApplicationRecord
    validates :title, presence: true
    validates :summary, presence: true, length: { maximum: 15 }
  validates :body, presence: true, length: { minimum: 5 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end

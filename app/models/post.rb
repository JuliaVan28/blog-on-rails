class Post < ApplicationRecord
    validates :title, presence: true
    validates :summary, presence: true, length: { maximum: 15 }
  validates :body, presence: true, length: { minimum: 5 }
  validates :image, presence: true

   mount_uploader :image, ImageUploader
   
   has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  # belongs_to :category

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end

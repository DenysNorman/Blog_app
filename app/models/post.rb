class Post < ApplicationRecord
  validates :title, presence: true, length: {maximum: 10}
  validates :content, presence: true, length: {maximum: 200}

  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, PostImageUploader

  has_reputation :votes, source: :user, aggregated_by: :sum
end

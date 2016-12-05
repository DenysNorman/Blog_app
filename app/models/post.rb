class Post < ApplicationRecord
  before_validation :generate_slug

  validates :title, presence: true, length: {maximum: 10}
  validates :content, presence: true, length: {maximum: 200}
  validates :slug, uniqueness: true, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, PostImageUploader

  has_reputation :votes, source: :user, aggregated_by: :sum

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= title.parameterize
  end
end

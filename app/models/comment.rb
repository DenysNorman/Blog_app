class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 100 }

  belongs_to :user
  belongs_to :post

  has_reputation :votes, source: :user, aggregated_by: :sum
end

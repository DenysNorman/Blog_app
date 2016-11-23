class User < ApplicationRecord
 validates :name, presence: true, length: { minimum: 3, maximum: 10 },
                                  uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_many :posts, dependent: :destroy
 has_many :comments, dependent: :destroy
end

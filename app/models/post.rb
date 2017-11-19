class Post < ApplicationRecord
  belongs_to :user
  has_many :commenting_users, through: :comments, source: :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
end

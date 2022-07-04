class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :body, :header, presence: true
end

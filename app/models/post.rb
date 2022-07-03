class Post < ApplicationRecord
  belongs_to :user

  validates :body, :header, presence: true
end

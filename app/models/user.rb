class User < ApplicationRecord
  has_many :posts

  validates :name, :last_name, presence: true
end

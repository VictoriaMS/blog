class User < ApplicationRecord
  has_many :posts

  validates :name, :last_name, presence: true
  
  def full_name
    "#{name} #{last_name}"
  end
end

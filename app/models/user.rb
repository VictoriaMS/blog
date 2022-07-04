class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts
  has_many :comments

  validates :name, :last_name, presence: true
  
  def full_name
    "#{name} #{last_name}"
  end

  def author_of?(resource)
    id == resource.user.id
  end
end

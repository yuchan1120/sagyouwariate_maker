class User < ApplicationRecord
  has_many :tables
  has_many :works
  validates :name, presence: true
  validates :name, length: { maximum: 7 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

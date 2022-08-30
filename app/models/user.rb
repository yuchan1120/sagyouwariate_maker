class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 7 }
  has_many :tables, dependent: :destroy
  has_many :works, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

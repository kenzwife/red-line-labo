class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tours, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tours, through: :likes, source: :tour
  has_many :comments, dependent: :destroy
  has_many :camps, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :gooded_camps, through: :goods, source: :camp
  has_many :reviews, dependent: :destroy
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 
  def already_liked?(tour)
    self.likes.exists?(tour_id: tour.id)
  end
  def already_gooded?(camp)
    self.goods.exists?(camp_id: camp.id)
  end
end

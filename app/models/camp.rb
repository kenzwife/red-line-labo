class Camp < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :goods, dependent: :destroy
    has_many :gooded_users, through: :goods, source: :user
    has_many :reviews, dependent: :destroy
end

class Pet < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings, dependent: :destroy
  validates :name, :species, :bio, :age, :price, presence: true
  mount_uploader :photo, PhotoUploader
end

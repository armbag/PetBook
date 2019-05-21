class Pet < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :bookings
  validates :name, :species, :bio, :age, :price, presence: true
  mount_uploader :photo, PhotoUploader
end

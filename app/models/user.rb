class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets, foreign_key: "owner_id", dependent: :destroy
  has_many :bookings, foreign_key: "sitter_id", dependent: :destroy
  has_many :booked_pets, through: :bookings, source: "pet", dependent: :destroy
  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  # validates :name, presence: true, uniqueness: true
  # validates :email, presence: true
end

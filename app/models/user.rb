class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets, foreign_key: "owner_id"
  has_many :bookings, foreign_key: "sitter_id"
  has_many :booked_pets, through: :bookings, source: "pet"
  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  # validates :name, presence: true, uniqueness: true
  # validates :email, presence: true
end

class Accommodation < ApplicationRecord
  validates :available_beds, :price, :description, :welcome_message, presence: true,
  numericality: { greater_than_or_equal_to: 0}
  validates :description, length: { minimum: 140 }
  has_many :user, through: :reservationsexit
  belongs_to :city
  has_many :reservations   
end

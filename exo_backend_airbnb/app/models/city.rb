class City < ApplicationRecord
  validates :name, :zip_code, presence: true
  validates :zip_code, 
  uniqueness: true, 
  format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "Please enter a valid french zip code" }
  has_many :accommodations
end

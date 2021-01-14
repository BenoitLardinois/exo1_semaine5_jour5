class User < ApplicationRecord
  validates :email, 
  uniqueness:true, 
  presence: true,
  format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Address mail not valid :(" }
  
  after_create :send_welcome_email
  def send_welcome_email
    # le code qui envoit l'email
  end
end

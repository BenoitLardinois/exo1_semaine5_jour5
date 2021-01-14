class Reservation < ApplicationRecord
  def start_must_be_before_end_time
    errors.add(:start_time, "must be before end time") unless
      start_time < end_time
  end
  belongs_to :user
  belongs_to :accommodation 
end

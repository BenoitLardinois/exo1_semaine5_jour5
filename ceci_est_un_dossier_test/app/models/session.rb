class Session < ApplicationRecord

  def is_started
    self.start_date < Time.now
  end
  
  def end_date
    self.start_date + (self.course.week.count * 7).day
  end
end

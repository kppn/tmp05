class Car < ActiveRecord::Base
  belongs_to :owner

  def expired?
    Time.now > created_at + 1.days + 12.hours + 50.minutes
  end
end

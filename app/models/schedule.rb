class Schedule < ApplicationRecord
  belongs_to :user

  before_create :set_fire_on_to_now
  def set_fire_on_to_now
    self.fire_on = Time.now if self.fire_on.nil?
  end

end

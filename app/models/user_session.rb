class UserSession < ActiveRecord::Base
  belongs_to :user

  MAX_AGE = 30.minutes

  validates_presence_of :user, :token

  def active?
    older_than?(MAX_AGE)
  end

  def older_than?(duration)
    age_in_seconds < duration
  end

  def age_in_seconds
    ((DateTime.now - updated_at.to_datetime) * 86400).seconds
  end
end

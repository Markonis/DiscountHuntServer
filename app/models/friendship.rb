class Friendship < ActiveRecord::Base
  belongs_to :user_a, class_name: 'User'
  belongs_to :user_b, class_name: 'User'

  validates_presence_of :user_a, :user_b

  def self.by_user(user_id)
    where("user_a_id = :user_id OR user_b_id = :user_id", user_id: user_id)
  end
end

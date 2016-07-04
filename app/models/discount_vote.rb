class DiscountVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :discount

  validates_presence_of :user, :discount
  validates_uniqueness_of :user, scope: :discount
end

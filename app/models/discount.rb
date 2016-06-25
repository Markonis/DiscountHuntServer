class Discount < ActiveRecord::Base

  belongs_to :user, inverse_of: :discounts
  belongs_to :location, dependent: :destroy
  belongs_to :photo, dependent: :destroy

  validates_presence_of :photo, :location, :title, :category, :price
end

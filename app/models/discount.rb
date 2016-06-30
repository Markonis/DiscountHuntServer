class Discount < ActiveRecord::Base

  belongs_to :user, inverse_of: :discounts
  belongs_to :location, dependent: :destroy
  belongs_to :photo, dependent: :destroy

  validates_presence_of :title, :category, :price, :user
  accepts_nested_attributes_for :location, :photo
end

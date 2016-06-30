class DiscountSearch < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :query
  before_create :set_result

  def set_result
    self.result = perform_search.to_json
  end

  def perform_search
    Discount.where('title LIKE :search OR description LIKE :search OR category LIKE :search', search: "%#{query}%")
  end
end

class DiscountSearch < ActiveRecord::Base
  belongs_to :user

  before_create :set_result

  def set_result
    self.result = perform_search.to_json
  end

  def perform_search
    if query.present?
      Discount.where('title LIKE :query OR description LIKE :query OR category LIKE :query', query: "%#{query}%")
    else
      Discount.all
    end
  end
end

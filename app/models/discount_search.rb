class DiscountSearch < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  accepts_nested_attributes_for :location

  before_create :set_result

  def set_result
    self.result = discounts_to_builder(perform_search).target!
  end

  def perform_search
    relation = if query.present?
      Discount.where('title LIKE :query OR description LIKE :query OR category LIKE :query', query: "%#{query}%")
    else
      Discount.all
    end

    relation = relation.includes(:location)

    if location.present?
      relation = relation.where(location_id: Location.in_radius(location))
    end

    relation
  end

  def discounts_to_builder(discounts)
    Jbuilder.new do |json|
      json.array! discounts do |discount|
        json.extract! discount, :id, :title
        json.location discount.location, :lat, :lng if discount.location
      end
    end
  end
end

class DiscountSearch < ActiveRecord::Base
  belongs_to :user

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

    relation.includes({user: :photo}, :photo, :location)
  end

  def discounts_to_builder(discounts)
    Jbuilder.new do |json|
      json.array! discounts do |discount|
        json.extract! discount, :id, :title, :description, :category, :votes, :price, :created_at, :updated_at
        json.user discount.user, :photo, :first_name, :last_name
        json.photo discount.photo
        json.location discount.location
      end
    end
  end
end

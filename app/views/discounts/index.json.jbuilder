json.array!(@discounts) do |discount|
  json.extract! discount, :id, :title, :description, :category, :votes, :price, :user_id, :location_id
  json.url discount_url(discount, format: :json)
end

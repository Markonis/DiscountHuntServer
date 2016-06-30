json.array!(@discount_searches) do |discount_search|
  json.extract! discount_search, :id, :query, :result, :user_id
  json.url discount_search_url(discount_search, format: :json)
end

json.array!(@discount_votes) do |discount_vote|
  json.extract! discount_vote, :id, :user_id, :discount_id
  json.url discount_vote_url(discount_vote, format: :json)
end

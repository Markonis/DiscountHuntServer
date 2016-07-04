json.array!(@friends_rankings) do |friends_ranking|
  json.extract! friends_ranking, :id, :user_id
  json.url friends_ranking_url(friends_ranking, format: :json)
end

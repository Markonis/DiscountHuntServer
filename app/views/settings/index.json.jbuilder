json.array!(@settings) do |setting|
  json.extract! setting, :id, :enable_background_process, :search_radius, :user_id
  json.url setting_url(setting, format: :json)
end

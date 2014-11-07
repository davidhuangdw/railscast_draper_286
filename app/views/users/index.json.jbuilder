json.array!(@users) do |user|
  json.extract! user, :id, :username, :full_name, :twitter_name, :github_name, :url, :avatar_image_name, :bio
  json.url user_url(user, format: :json)
end

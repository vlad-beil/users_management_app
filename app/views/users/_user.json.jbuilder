json.extract! user, :id, :user_name, :about, :birthday, :img, :created_at, :updated_at
json.url user_url(user, format: :json)

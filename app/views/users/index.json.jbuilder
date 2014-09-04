json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :std_num
  json.url user_url(user, format: :json)
end

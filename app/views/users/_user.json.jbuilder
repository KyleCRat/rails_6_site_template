json.extract! user, :id, :first_name, :middle_name, :last_name, :password, :password_confirmation, :email, :created_at, :updated_at
json.url user_url(user, format: :json)

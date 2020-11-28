json.extract! sign_up, :id, :fullname, :store_location, :created_at, :updated_at
json.url sign_up_url(sign_up, format: :json)

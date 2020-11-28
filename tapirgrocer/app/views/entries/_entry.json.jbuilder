json.extract! entry, :id, :fullname, :nric, :body_temp, :created_at, :updated_at
json.url entry_url(entry, format: :json)

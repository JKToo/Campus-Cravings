json.extract! profile, :id, :fname, :lname, :tag, :school, :status, :created_at, :updated_at
json.url profile_url(profile, format: :json)

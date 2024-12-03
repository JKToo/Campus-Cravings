json.extract! posting, :id, :place, :description, :rating, :location, :school_id, :created_at, :updated_at
json.url postings_url(posting, format: :json)

json.extract! profile, :id, :name, :github_url, :github_user, :followers, :following, :stars, :last_year_contributions, :profile_picture_url, :organization, :location, :created_at, :updated_at
json.url profile_url(profile, format: :json)

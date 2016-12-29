json.extract! route, :id, :title, :created_at, :updated_at
json.url route_url(route, format: :json)
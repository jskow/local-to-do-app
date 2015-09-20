json.array!(@places) do |place|
  json.extract! place, :id, :name, :price, :activity
  json.url place_url(place, format: :json)
end

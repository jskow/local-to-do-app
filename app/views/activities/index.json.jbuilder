json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :cost, :gender, :group_size, :type1, :type2, :age
  json.url activity_url(activity, format: :json)
end

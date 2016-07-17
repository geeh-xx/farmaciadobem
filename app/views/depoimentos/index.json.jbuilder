json.array!(@depoimentos) do |depoimento|
  json.extract! depoimento, :id, :depoimento, :user_id
  json.url depoimento_url(depoimento, format: :json)
end

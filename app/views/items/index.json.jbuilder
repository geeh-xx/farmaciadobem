json.array!(@items) do |item|
  json.extract! item, :id, :medicamento_id, :carrinho_id
  json.url item_url(item, format: :json)
end

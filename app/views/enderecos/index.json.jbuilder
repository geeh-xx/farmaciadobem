json.array!(@enderecos) do |endereco|
  json.extract! endereco, :id, :nome, :rua, :numero, :bairro, :cidade, :estado, :cep, :user_id
  json.url endereco_url(endereco, format: :json)
end

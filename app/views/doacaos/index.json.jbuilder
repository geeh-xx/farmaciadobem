json.array!(@doacaos) do |doacao|
  json.extract! doacao, :id, :tipo, :local_doacao, :data_doacao, :horario_doacao, :user_id
  json.url doacao_url(doacao, format: :json)
end

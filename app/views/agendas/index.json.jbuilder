json.array!(@agendas) do |agenda|
  json.extract! agenda, :id, :nome, :sobrenome, :email, :tel_residencial, :tel_celular, :tel_comercial
  json.url agenda_url(agenda, format: :json)
end

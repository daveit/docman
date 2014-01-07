json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :phone, :email, :mobile
  json.url contact_url(contact, format: :json)
end

json.array!(@materials) do |material|
  json.extract! material, :id, :name, :description, :link
  json.url material_url(material, format: :json)
end

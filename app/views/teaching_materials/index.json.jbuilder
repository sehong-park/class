json.array!(@teaching_materials) do |teaching_material|
  json.extract! teaching_material, :id, :name, :description, :link
  json.url teaching_material_url(teaching_material, format: :json)
end

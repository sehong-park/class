json.array!(@lectures) do |lecture|
  json.extract! lecture, :id, :name, :start_date, :end_date, :instructor
  json.url lecture_url(lecture, format: :json)
end

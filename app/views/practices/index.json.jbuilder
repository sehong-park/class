json.array!(@practices) do |practice|
  json.extract! practice, :id, :lesson_id, :question, :right_answer
  json.url practice_url(practice, format: :json)
end

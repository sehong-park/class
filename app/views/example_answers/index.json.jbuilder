json.array!(@example_answers) do |example_answer|
  json.extract! example_answer, :id, :example_answer
  json.url example_answer_url(example_answer, format: :json)
end

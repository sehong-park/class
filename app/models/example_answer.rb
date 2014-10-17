class ExampleAnswer < ActiveRecord::Base
  
  # association
  belongs_to :practice
  
  # validations
  validates :practice_id, presence: true
  validates :example_answer, presence: true,
                             length: {maximum: 255}
end

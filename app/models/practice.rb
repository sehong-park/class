class Practice < ActiveRecord::Base
  
  # associatioins
  belongs_to :lesson
  has_many :example_answers, dependent: :destroy
  
  # DEFAULT_SCOPE
  default_scope -> { order('created_at ASC') }
  
  # validations
  validates :lesson_id, presence: true
  validates :question, presence: true, length: { maximum: 255 }
  validates :right_answer, presence: true
  
  # image validation
  DEFAULT_IMAGE = "dummy/160x160.png"
  has_attached_file :image, styles: { medium: "200x200#", thumb: "100x100#" },
                            default_url: DEFAULT_IMAGE
  
  validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                               size: { :in => 0..300.kilobytes }
end

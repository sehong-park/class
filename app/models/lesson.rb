class Lesson < ActiveRecord::Base
  belongs_to :lecture
  
  # DEFAULT_SCOPE
  default_scope -> { order('created_at DESC') }
  
  # lecture_id validation
  validates :lecture_id, presence: true
  
  # title validation
  validates :title, presence: true
  
  # body validation
  validates :body, presence: true,
                   length: { maximum: 65536 }
  
  # image validation
  DEFAULT_IMAGE = "dummy/160x160.png"
  has_attached_file :image, styles: { medium: "160x160>", thumb: "80x80>" },
                            default_url: DEFAULT_IMAGE
  
  validates_attachment :image, presence: true,
                               content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                               size: { :in => 0..100.kilobytes }
  
end

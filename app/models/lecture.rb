class Lecture < ActiveRecord::Base
  
  # DEFAULT_SCOPE
  default_scope -> { order('created_at DESC') }

  # association
  belongs_to :course
  has_and_belongs_to_many :materials
  
  # name validation
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  
  # description validation
  validates :description, presence: true,
                          length: { maximum: 250 }
  
  # level(0...4) validation 
  validates :level, presence: true,
                    numericality: true,
                    inclusion: { in: 0..4 } # 0: beginner .. 5: master
  
  # image validation
  DEFAULT_IMAGE = "dummy/160x160.png"
  has_attached_file :image, styles: { medium: "160x160>", thumb: "80x80>" },
                            default_url: DEFAULT_IMAGE
  
  validates_attachment :image, presence: true,
                               content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                               size: { :in => 0..100.kilobytes }
  
  # course_id validation
  validates :course_id, presence: true,
                        numericality: true
  
  # instructor valditation
  validates :instructor, presence: true,
                         numericality: true
  
end

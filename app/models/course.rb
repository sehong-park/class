class Course < ActiveRecord::Base
  
  # DEFAULT_SCOPE
  default_scope -> { order('created_at DESC') }
  
  # association
  has_many :lectures
  
  # name validation
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  
  # description validation
  validates :description, presence: true,
                          length: { maximum: 250 }
  
  # image validation
  DEFAULT_IMAGE = "dummy/200x200.png"
  has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" },
                            default_url: DEFAULT_IMAGE
  
  validates_attachment :image, presence: true,
                               content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                               size: { :in => 0..100.kilobytes }
  
end

class Material < ActiveRecord::Base
  
  # name validation
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  
  # description validation
  validates :description, presence: true,
                          length: { maximum: 250 }
  
  # link validation
  validate :link, presence: true,
                  length: { maximum: 250 }
  
  # image validation
  DEFAULT_IMAGE = "dummy/160x160.png"
  has_attached_file :image, styles: { medium: "160x160>", thumb: "80x80>" },
                            default_url: DEFAULT_IMAGE
  
  validates_attachment :image, presence: true,
                               content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                               size: { :in => 0..100.kilobytes }
  
  
end

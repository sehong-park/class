class Course < ActiveRecord::Base
  
  # name validation
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  
  # description validation
  validates :description, presence: true,
                          length: { maximum: 250 }
  
  # image validation
  has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" },
                            default_url: "/images/dummy/200x200.png"
  validates_attachment :image, presence: true,
                               content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                               size: { :in => 0..100.kilobytes }
  
end

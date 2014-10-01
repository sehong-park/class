class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  # ASSOSIATION
  belongs_to :team
  
  # DEFAULT_SCOPE
  default_scope -> { order('created_at DESC') }
  
  #validation
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :std_num, presence: true
  
  # image validation
  DEFAULT_AVATAR = "dummy/user_80x80.png"
  has_attached_file :avatar, styles: { medium: "160x160>", thumb: "80x80>" },
                             default_url: DEFAULT_AVATAR
  
  validates_attachment :avatar, presence: true,
                               content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                               size: { :in => 0..100.kilobytes }

  
  has_secure_password
  validates :password, length: { minimum: 6 }, on: :create
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end

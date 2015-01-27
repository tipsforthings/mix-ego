require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  
  validates_confirmation_of :password
  validates_length_of :password, :within => 6..20
  validates_presence_of :password, :if => :password_required?
  
  has_one :profile, :dependent => :destroy
  has_many :articles, -> { order('published_at DESC, title ASC')}, :dependent => :nullify
  has_many :replies, :through => :articles, :source => :comments
  
  before_save :encrypt_new_password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end
  
  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end
  
  protected
    def encrypt_new_password
      return if password.blank?
      self.hashed_password = encrypt(password)
    end
    
    def password_required?
      hashed_password.blank? || password.present?
    end
    
    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
end

require 'digest/md5'
class User < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive:false }, 
                  presence: true, 
                  length: { maximum: 32 }, 
                  format:{ with: /\A[a-z0-9-]+\z/i }

  validates :email, uniqueness: { case_sensitive:false }, 
                    presence: true, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }

  before_save :encrypt_password

  has_many :attachments, dependent: :delete_all

  class << self
    def authenticate(name, password)
      user = User.find_by_name(name) 
      user && user.password== Digest::SHA256.hexdigest(user.password_salt+password) ? user : nil
    end

    def authenticate_with_salt(id, cookies_salt)
      user = find_by_id(id)
      (user && user.password_salt == cookies_salt) ? user : nil
    end
  end

  private
  def encrypt_password
    self.password_salt = Array.new(10) { rand(1024).to_s(36) }.join
    self.password = Digest::SHA256.hexdigest(self.password_salt+self.password) 
  end
end

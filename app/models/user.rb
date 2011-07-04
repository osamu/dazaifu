require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :messages
  validates_presence_of :userid
  validates_uniqueness_of :userid
  attr_accessor :password_confirmation
  validates_confirmation_of :password 
  validate :password_non_blank

  def password_non_blank
    errors.add(:password, "Please input password.") if hashed_password.blank?
  end
  def password ; @password end

  def password=(pwd) 
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def self.authenticate(name, password)
    user = self.find_by_userid(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  private

  def self.encrypted_password(password, salt)
    string_to_hash = password + "test" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end


end

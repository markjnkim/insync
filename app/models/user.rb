require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :first_name, :last_name, presence: true
  validates :email, presence: true
  validate :password_present
# user has many events  -> user_id on events
  has_many :events

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(password)
    @password = Password.create(password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return user if user && user.password == password
  end

  private
  def password_present
    errors.add(:password, "cannot be blank") if self.password == ""
  end
end


class User < ActiveRecord::Base

  # Remember to create a migration!
  validates :name,      presence: true
  validates :email,     presence: true
  validates :password,  presence: true

  def authenticate(entered_pass)
    self.password == entered_pass
  end
end

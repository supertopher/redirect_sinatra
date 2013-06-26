class User < ActiveRecord::Base

  # Remember to create a migration!
  validates :name,      presence: true
  validates :email,     presence: true
  validates :password,  presence: true

  def self.authenticate(entered_email, entered_pass)
    current_user = User.find_by_email(entered_email)
    p current_user
    if current_user.email == entered_email && current_user.password == entered_pass
      return true
    end
    false
  end

end

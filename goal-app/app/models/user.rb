# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  username      :string           not null
#  password      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  session_token :string           not null
#
class User < ApplicationRecord
  validates :username, :password, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  before_validation :ensure_session_token

  def self.find_by_credentials(username,password)
    user=User.find_by(username:username)
    if user && user.password == password 
        user
    else   
        nil 
    end 
  end 

  def generate_session_token
    token = SecureRandom::urlsafe_base64
    while User.exists?(session_token: token)
        token = SecureRandom::urlsafe_base64
    end 
    token 
  end 

  def ensure_session_token
    self.session_token ||= generate_session_token
  end 
  
end

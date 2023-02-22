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
end

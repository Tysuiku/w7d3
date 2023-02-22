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
FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.character }
    password { "password" }
    session_token { SecureRandom::urlsafe_base64 }
  end
end

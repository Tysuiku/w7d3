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
require "rails_helper"

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe 'finds user by credentials' do
    context 'with a valid username and password' do
      it 'returns the proper user'do
      sally = User.create(username: 'sally_lee', password: 'password')
      user = User.find_by_credentials('sally_lee', 'password')

      expect(sally.username).to eq(user.username)
      expect(sally.password).to eq(user.password)
    end
  end
end 


  describe "uniqueness" do
    before :each do
      create(:user)
    end
    it { should validate_uniqueness_of(:username) }
    it { should validate_uniqueness_of(:session_token) }
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'email should be present' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'password should be longer than 8 characters' do
    @user.password = '1234'
    expect(@user).to_not be_valid
  end
end

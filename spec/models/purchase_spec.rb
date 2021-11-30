require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before(:each) do
    @user = create(:user)
    @group = create(:group, author_id: @user.id)
    @purchase = create(:purchase, author_id: @user.id)
  end

  it 'name should be present' do
    @purchase.name = nil
    expect(@purchase).to_not be_valid
  end

  it 'amount should be present' do
    @purchase.amount = nil
    expect(@purchase).to_not be_valid
  end

  it 'amount should be numeric' do
    @purchase.amount = 'I am a number'
    expect(@purchase).to_not be_valid
  end
end

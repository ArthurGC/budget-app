require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = create(:user)
    @group = create(:group, author_id: @user.id)
    @purchase1 = create(:purchase, author_id: @user.id)
    @purchase2 = create(:purchase, author_id: @user.id)
  end

  it 'name should be present' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'icon should be present' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end

  it 'total_amount should be the total amount of purchases' do
    @group.purchases << @purchase1
    @group.purchases << @purchase2
    expect(@group.total_amount).to eq(@purchase1.amount + @purchase2.amount)
  end
end

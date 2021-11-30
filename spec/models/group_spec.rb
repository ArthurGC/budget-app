require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = create(:user)
    @group = create(:group, author_id: @user.id)
  end

  it 'name should be present' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'icon should be present' do
    @group.icon = nil
    expect(@group).to_not be_valid
  end

end

require 'rails_helper'

RSpec.describe 'Purchase page', type: :feature do
  describe 'index test' do
    before(:all) do
      @user = create(:user)
      @group = create(:group, author_id: @user.id)
      @purchase = create(:purchase, author_id: @user.id)
      @group.purchases << @purchase
    end

    before(:each) do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Log in'
      visit group_purchases_path(@group)
    end

    it 'expects to see group name' do
      expect(page).to have_content(@purchase.name)
    end

    it 'log-in and expects to go to add transaction page' do
      click_link 'ADD NEW TRANSACTION'
      expect(page).to have_current_path(new_group_purchase_path(@group))
    end

    it 'add a new transaction to the recipe' do
      click_link 'ADD NEW TRANSACTION'
      fill_in 'purchase_name', with: 'COD 4'
      fill_in 'purchase_amount', with: '1'
      click_button 'ADD TRANSACTION'
      expect(page).to have_content('COD 4')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Group page', type: :feature do
  describe 'index test' do
    before(:all) do
      @user = create(:user)
      @group = create(:group, author_id: @user.id)
    end

    before(:each) do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
      end
      click_button 'Log in'
    end

    it 'expects to see category name' do
      expect(page).to have_content(@group.name)
    end

    it 'log-in and expects to go to add category page' do
      click_link 'ADD NEW CATEGORY'
      expect(page).to have_current_path(new_group_path)
    end

    it 'add a new category to the recipe' do
      click_link 'ADD NEW CATEGORY'
      fill_in 'group_name', with: 'Games'
      click_button 'ADD CATEGORY'
      expect(page).to have_content('Games')
    end
  end
end

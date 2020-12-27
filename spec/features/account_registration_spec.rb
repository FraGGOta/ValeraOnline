require 'rails_helper'

RSpec.describe 'Account Regisration', type: :feature do
  describe 'User registration' do
    it 'they see menu after registration' do
      visit '/sign_up'

      fill_in 'form_account_nick', with: 'nickname'
      fill_in 'form_account_passwd', with: 'password'
      click_button 'commit'

      expect(page).to have_current_path('/menu')
    end
  end
end

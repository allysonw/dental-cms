require 'rails_helper'

RSpec.feature "Sign in", type: :devise do
  # OmniAuth.config.test_mode = true
  # OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
  #   :provider => 'google_oauth2',
  #   :uid => '123545',
  #   :name => 'Allyson Wesman'
  # })
  #
  #
  # before do
  #   Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
  #   Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  # end

  scenario "something" do
    visit '/'
  end

  scenario 'user cannot sign in if not registered' do
    signin('test@example.com', 'please123')
    expect(page).to have_content(/#{I18n.t('devise.failure.not_found_in_database', authentication_keys: 'email')}/i)
  end

  scenario 'user can sign in with valid credentials' do
    user = FactoryBot.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  scenario 'user cannot sign in with wrong email' do
    user = FactoryBot.create(:user)
    signin('invalid@email.com', user.password)
    expect(page).to have_content(/#{I18n.t('devise.failure.not_found_in_database', authentication_keys: 'email')}/i)
  end

  scenario 'user cannot sign in with wrong password' do
    user = FactoryBot.create(:user)
    signin(user.email, 'invalidpass')
    expect(page).to have_content(/#{I18n.t('devise.failure.invalid', authentication_keys: 'email')}/i)
  end
end

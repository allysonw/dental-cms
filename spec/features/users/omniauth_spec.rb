require 'rails_helper'

RSpec.feature "Sign in", type: :devise do
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    :provider => 'google_oauth2',
    :uid => '123545',
    :info => {
      :name => 'Andrew Wesman'
    }
  })

  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  scenario "Sign in with Google account" do
    visit new_user_session_path
    expect(page).to have_content("Sign in with GoogleOauth2")
    click_link "Sign in with GoogleOauth2"
    expect(page).to have_content("Andrew Wesman")
  end
end

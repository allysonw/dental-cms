require 'rails_helper'

RSpec.feature "Sign in", type: :devise do
  OmniAuth.config.test_mode = true

  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  scenario "Sign in with Google account" do

    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider => 'google_oauth2',
      :uid => '12354555566',
      :info => {
        :name => 'Andrew Wesman',
        :email => 'awesman@icloud.com'
      }
    })

    visit new_user_session_path
    click_link "Sign in with GoogleOauth2"
    expect(page).to have_content("Andrew Wesman")
  end

  scenario "Sign in with Facebook account" do

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :uid => 'f3420912342facebook',
      :info => {
        :name => 'Andrew Wesman',
        :email => 'awesman@icloud.com'
      }
    })

    visit new_user_session_path
    click_link "Sign in with Facebook"
    expect(page).to have_content("Andrew Wesman")
  end

  scenario "Sign in with multiple providers using the same email", focus: true do

    User.create(name: "Andrew Wesman", email: "awesman@icloud.com", password: "testpassword", uid: "googleuid234", provider: "google_oauth2")

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :uid => 'f3420912342',
      :info => {
        :name => 'Andrew Wesman',
        :email => 'awesman@icloud.com'
      }
    })

    visit new_user_session_path
    click_link "Sign in with Facebook" # => Error! Emails must be unique (Devise Validation)
    # TODO: separate users and identities for multiple omniauth providers
    expect(page).to have_content("Andrew Wesman")

  end
end

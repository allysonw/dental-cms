class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    set_and_redirect_user
  end

  def google_oauth2
    set_and_redirect_user
  end

  def set_and_redirect_user
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end

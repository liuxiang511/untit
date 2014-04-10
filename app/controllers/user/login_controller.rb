class User::LoginController < ApplicationController
  def index

  end
  def login
    if logged_in?
      redirect_to root_path and return
    end
    login_user = User.find_by(username: params[:username],password: params[:password])
    if login_user.present?
      set_user(login_user)
    end
    redirect_to root_path and return
  end
  private
  def set_user(_user)
    return if _user.blank?
    login_token = User.create_email_token

    # set session
    session[:user_id] = _user.id
    session[:login_token] = login_token
    session[:user_type] = _user.user_type == 1 ? "firm" : "user"

    # update user info
    _user.sign_in_count += 1
    _user.save
  end
end
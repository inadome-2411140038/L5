class TopController < ApplicationController
  def main
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def login
    uid = params[:uid]
    pass = params[:pass]

    user = User.find_by(uid: uid)

    if user != nil && BCrypt::Password.new(user.pass) == pass
      session[:login_uid] = uid
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end

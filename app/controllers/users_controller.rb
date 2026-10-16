class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    uid = params[:user][:uid]
    pass = params[:user][:pass]

    if User.find_by(uid: uid)
      redirect_to new_user_path
    else
      User.create(
        uid: uid,
        pass: BCrypt::Password.create(pass)
      )
      redirect_to users_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path
  end
end

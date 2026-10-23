class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    uid = params[:user][:uid]

    if User.find_by(uid: uid)
      redirect_to new_user_path
    else
      user = User.new(
        uid: uid,
        password: params[:user][:password],
        password_confirmation: params[:user][:password_confirmation]
      )

      if user.save
        redirect_to users_path
      else
        @user = user
        render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to users_path
  end
end
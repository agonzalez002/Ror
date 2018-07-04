class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit]

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :phone_number, :date_of_birth)
  end

  def index
    @users = User.order(:id).all

  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @users = User.find(params[:id]).destroy

    if @users.save
      redirect_to @users
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def load_user
    @user = User.find params[:id]
  end
end

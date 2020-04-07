class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def index
    @users = User.all
  end
  def edit
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(permitted_parameters)

    if @user.save
      flash[:success] = "User #{@user.name} was created successfully"
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    if @user.update_attributes(permitted_parameters)
      flash[:success] = "User #{@user.name} was updated successfully"
      redirect_to users_path
    else
      render :new
    end
  end
  private

  def set_user
    @user = User.find(params[:id])
  end

  def permitted_parameters
    params.require(:user).permit(:email, :encrypted_password, :created_at, :updated_at, :user_type)
  end
end

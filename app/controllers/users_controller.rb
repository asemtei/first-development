class UsersController < ApplicationController
before_action :require_signin, except: [:new, :create]
before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end
  
  def edit
  end
  
  def update
    if @users.update(user_params)
      redirect_to @users, notice: "Account successfully updated!"
    else
      render :edit
    end
  end

  def new
    @users = User.new
  end
  
  def create
    @users = User.new(user_params)
    if @users.save
      session[:user_id] = @users.id
      redirect_to @users, notice: "Account successfully created!"
    else
      render :new
    end
  end
  
  def destroy
    @users.destroy
    session[:user_id] = nil
    redirect_to root_path, alert: "Account successfully deleted!"
  end
  
private

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end

  def require_correct_user
    @users = User.find(params[:id])
    unless current_user?(@users)
    redirect_to root_path, notice: 'That\'s not your account you rascal'
    end
  end


end


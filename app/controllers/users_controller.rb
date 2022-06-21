class UsersController < ApplicationController
  before_action :logged_in_user, only: [ :edit, :update] 
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page]) #for pagination
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      log_in @user
      flash[:success]= " Singed in successfully "
      redirect_to @user  #same as -> redirect_to user_url(@user)
      #UserMailer.welcome_email(@user).deliver_now
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      @user.reload
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def save
    redirect_to "index"
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log-in"
        redirect_to "new"
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user=current_user 
    end
end

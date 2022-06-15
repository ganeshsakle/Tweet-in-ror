class UsersController < ApplicationController
  def index
    @user=User.all
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      log_in @user
      flash[:success]= " Singed in successfully "
      redirect_to @user  #same as -> redirect_to user_url(@user)
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  def edit
  end

  def save
    redirect_to "index"
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
    end
end

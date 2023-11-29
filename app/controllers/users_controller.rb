class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      flash[:alert] = "*入力に誤りがあります*"
      render 'new'
    end
  end
  

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :birth_date, 
                                 :postal_code,
                                 :address,
                                 :telephone_number,
                                 :terms_accepted,
                                 :password,
                                 :password_confirmation)
  end
end
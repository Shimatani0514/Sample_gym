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
    case params[:id]
    when 'home', 'service', 'fee', 'staff', 'shop', 'contact'
      redirect_to "/#{params[:id]}" # もしくは特定のパスにリダイレクトしたいページのルートを指定
    else
      # 通常の処理（ユーザー詳細など）を行います
      @user = User.find(params[:id])
    end
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

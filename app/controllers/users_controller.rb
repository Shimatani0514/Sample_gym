class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      redirect_to @user
    else
      flash.now[:alert_index] = "登録に失敗しました"
      render 'new', status: :unprocessable_entity
    end
  end
  

  def show
    @current_user = User.find(current_user.id)
    @user_reservations = current_user.reservations.where("start_time >= ?", DateTime.current).order(day: :desc)

    case params[:id]
    when 'home', 'service', 'fee', 'staff', 'shop', 'contact', 'reservations'
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
                                 :password_confirmation,
                                 :street_number)
  end
end

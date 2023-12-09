class ReservationsController < ApplicationController


    def index
        @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 2).order(day: :desc)
    end

    def new
        @reservation = Reservation.new
        @day = params[:day]
        @time = params[:time]
        @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
      
        message = Reservation.check_reservation_day(@day.to_date, @time.to_s)
        if message
          redirect_to @reservation, flash: { alert: message }
        end
    end


    def show 

        case params[:id]
        when 'home', 'service', 'fee', 'staff', 'shop', 'contact', 'reservations'
          redirect_to "/#{params[:id]}" # もしくは特定のパスにリダイレクトしたいページのルートを指定
        else
          # 通常の処理（ユーザー詳細など）を行います
          @reservation = Reservation.find(params[:id])
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            redirect_to reservation_show_path(@reservation.id)
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        
        if @reservation.day > Date.today
          if @reservation.destroy
            flash[:success] = "予約をキャンセルしました"
          else
            flash[:error] = "予約をキャンセルできませんでした"
          end
        else
          flash[:error] = "当日の予約はキャンセルできません"
        end
        
        redirect_to user_path(current_user.id)
    end
      
      
    private
    def reservation_params
        params.require(:reservation).permit(:day, :time, :user_id, :start_time)
    end
end
module ReservationsHelper
    def times
        times = ["1:00",
                 "2:00",
                 "3:00",
                 "4:00",
                 "5:00",
                 "6:00",
                 "7:00",
                 "8:00",
                 "9:00",
                 "10:00",
                 "11:00",
                 "12:00",
                 "13:00",
                 "14:00",
                 "15:00",
                 "16:00",
                 "17:00",
                 "18:00",
                 "19:00",
                 "20:00",
                 "21:00",
                 "22:00",
                 "23:00",
                 "24:00"]
      end

      # 今日から2ヶ月先までの予約データを取得し、特定の形式で配列に格納するメソッド
    #def self.reservations_after_three_months
        #reservations = Reservation.where("day >= ?", Date.current).where("day < ?", Date.current + 2.months).order(day: :desc)
        #reservations.map { |reservation| { day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time } }
    #end
  
    # 予約データに指定した日付と時間が含まれているか確認するメソッド
    def check_reservation(reservations, day, time)
        reservations.any? { |reservation| reservation[:day] == day.strftime("%Y-%m-%d") && reservation[:time] == time }
    end
end

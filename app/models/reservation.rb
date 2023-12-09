class Reservation < ApplicationRecord
  belongs_to :user

  def self.check_reservation_day(day, time)
    selected_datetime = DateTime.parse("#{day} #{time}")
    current_datetime = DateTime.now
  
    if selected_datetime <= current_datetime
      return "現在時刻か未来の時刻を選択してください。"
    elsif selected_datetime > current_datetime.end_of_day + 2.months
      return "2ヶ月以降の日付は選択できません。"
    end
  end

  def self.reservations_after_three_month
      # 今日から2ヶ月先までのデータを取得
      reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 2).order(day: :desc)
      # 配列を作成し、データを格納
      # DBアクセスを減らすために必要なデータを配列にデータを突っ込んでます
      reservation_data = []
      reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
      end
      reservation_data
  end

end

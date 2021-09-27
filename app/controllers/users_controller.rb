class UsersController < ApplicationController
  def index
  end

  MAX_RESERVATION_DATE = 12

  def show
    @user = User.find(current_user.id)
    @user_reservations = current_user.reservations.where("start_time >= ?", DateTime.current)
    @visit_historys = current_user.reservations.where("start_time < ?", DateTime.current).where("start_time > ?", DateTime.current << MAX_RESERVATION_DATE)
  end
end

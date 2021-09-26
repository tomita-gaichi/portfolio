class AddTimeToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :time, :string
  end
end

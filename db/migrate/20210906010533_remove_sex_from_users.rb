class RemoveSexFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :sex, :integer
  end
end

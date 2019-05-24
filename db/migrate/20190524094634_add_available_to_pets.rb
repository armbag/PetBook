class AddAvailableToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :from, :date
    add_column :pets, :to, :date
  end
end

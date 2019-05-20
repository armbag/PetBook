class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :pet, foreign_key: true
      t.string :start
      t.string :end
      t.references :sitter, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

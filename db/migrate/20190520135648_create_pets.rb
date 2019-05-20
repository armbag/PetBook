class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.text :bio
      t.integer :age
      t.integer :price
      t.references :owner, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

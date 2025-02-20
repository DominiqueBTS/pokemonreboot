class CreatePokeballs < ActiveRecord::Migration[8.0]
  def change
    create_table :pokeballs do |t|
      t.string :caught_on
      t.string :location
      t.references :trainer, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end

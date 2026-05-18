class CreateMoves < ActiveRecord::Migration[8.1]
  def change
    create_table :moves do |t|
      t.references :kifu, null: false, foreign_key: true
      t.integer :move_number
      t.integer :x
      t.integer :y
      t.integer :color

      t.timestamps
    end
  end
end

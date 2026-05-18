class CreateKifus < ActiveRecord::Migration[8.1]
  def change
    create_table :kifus do |t|
      t.timestamps
    end
  end
end

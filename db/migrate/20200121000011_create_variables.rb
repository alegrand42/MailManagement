class CreateVariables < ActiveRecord::Migration[5.2]
  def change
    create_table :variables do |t|
      t.references :mail, foreign_key: true
      t.date :court_date
      t.string :civility
      t.string :denomination

      t.timestamps
    end
  end
end

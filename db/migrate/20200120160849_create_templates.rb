class CreateTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :templates do |t|
      t.string :code, null: false
      t.text :mail, null: false

      t.timestamps
    end
  end
end

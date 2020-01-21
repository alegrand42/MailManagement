class CreateMails < ActiveRecord::Migration[5.2]
  def change
    create_table :mails do |t|
      t.integer :template_id, null: false
      t.string :subject, null: false
      t.string :to, null: false
      t.string :from, null: false
      t.date :deliver_at

      t.timestamps
    end
  end
end

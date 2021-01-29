class CreateRecipients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipients do |t|
      t.string     :name,      null: false
      t.string     :last_name, null: false
      t.string     :email,     null: false
      t.references :address,   null: false, foreign_key: true
      t.references :order,     null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|
      t.references :order, null: false, foreign_key: true
      t.integer 	 :kind,  null: false
      t.string 		 :size,  null: true

      t.timestamps
    end
  end
end

class AddNotifyToOrders < ActiveRecord::Migration[6.1]
  def change
  	add_column :orders, :notify, :boolean, null:false, default: true
  end
end

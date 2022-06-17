class Createorderstable < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.date :order_date
      t.float :value
      t.float :commission
      t.string :mobile
      t.text :address
      t.string :delivery_status

      t.timestamps
    end
  end
end

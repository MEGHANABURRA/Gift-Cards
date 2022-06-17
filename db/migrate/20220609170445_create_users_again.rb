class CreateUsersAgain < ActiveRecord::Migration[6.1]
  def change
    create_table :users_agains do |t|
        t.string :name
        t.string :email
        t.string :password_digest
        t.integer :role
        t.timestamps
    end
  end
end

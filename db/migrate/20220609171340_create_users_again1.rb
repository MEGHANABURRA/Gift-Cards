class CreateUsersAgain1 < ActiveRecord::Migration[6.1]
  def change
    create_table :users_again1s do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :role
      t.timestamps
    end
  end
end

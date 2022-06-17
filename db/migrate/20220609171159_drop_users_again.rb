class DropUsersAgain < ActiveRecord::Migration[6.1]
  def change
    drop_table :users_again1s
  end
end

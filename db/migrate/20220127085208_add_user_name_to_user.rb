class AddUserNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :User_name, :string
  end
end

class AddColAuUserName < ActiveRecord::Migration
  def change
   
    add_column :users, :au_user_name, :string
  end
end

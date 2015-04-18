class AddCreateUsers < ActiveRecord::Migration
  def up
  	add_column :remember_token, :string
  end

  def down
  	remove_column :remember_token, :string	
  end
end

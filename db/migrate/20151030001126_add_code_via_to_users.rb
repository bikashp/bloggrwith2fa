class AddCodeViaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :code_via, :integer, default: 1
  end
end

class AddStatusToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :status, :string
    add_column :users, :status, :string
  end
end

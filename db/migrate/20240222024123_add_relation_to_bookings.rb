class AddRelationToBookings < ActiveRecord::Migration[7.1]
  def up
    remove_foreign_key :bookings, :books
    remove_foreign_key :bookings, :users

    change_table :bookings do |t|
      t.remove :book_id
      t.remove :user_id
      t.belongs_to :book
      t.belongs_to :user
    end
  end

  def down
    change_table :bookings do |t|
      t.change :book_id, :integer
      t.change :user_id, :integer
    end
  end
end
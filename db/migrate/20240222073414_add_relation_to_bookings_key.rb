class AddRelationToBookingsKey < ActiveRecord::Migration[7.1]
  def up
    change_table :bookings do |t|
      t.remove :book_id
      t.remove :user_id
      t.belongs_to :book, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end
  end

  def down
    change_table :bookings do |t|
      t.change :book_id, :integer
      t.change :user_id, :integer
    end
  end
end

class Booking < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.datetime :out_date
      t.datetime :due_date
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

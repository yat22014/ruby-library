class Book < ApplicationRecord
    include BookVisible

    has_many :bookings
    has_many :users, through: :bookings
end

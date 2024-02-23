class User < ApplicationRecord
    include UserVisible

    has_many :bookings
    has_many :books, through: :bookings
end

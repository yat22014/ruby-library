class Booking < ApplicationRecord
    belongs_to :book
    belongs_to :user

    before_create :add_borrow_date
    after_save :update_book_status
    before_update :update_book_status, if: :due_date_empty?

    # add default booking date
    private
      def add_borrow_date
        self.out_date = DateTime.current()
      end

    # change book status
    private
      def update_book_status
        book = Book.find_by(id: book_id)
        if book.present?
            book.update(status:  'booked')
        end
      end

    private
      def update_book_status
        book = Book.find_by(id: book_id)
        if book.present?
            book.update(status:  'in_stock')
        end
      end
      
    private
      def due_date_empty?
        !self.due_date.present?
      end
end

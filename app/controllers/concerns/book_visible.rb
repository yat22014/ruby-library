module BookVisible
    extend ActiveSupport::Concern

    VALID_STATUSES = ['in_stock', 'booked', 'archived']
  
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end
  
    class_methods do
        def public_count
          where(status: ['in_stock', 'booked']).count
        end
    end

    def archived?
      status == 'archived'
    end
end
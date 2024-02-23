module UserVisible
    extend ActiveSupport::Concern

    VALID_STATUSES = ['active', 'archived']
  
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end
  
    class_methods do
        def public_count
          where(status: 'active').count
        end
    end

    def archived?
      status == 'archived'
    end
end
class Payment < ApplicationRecord
  include ::PaymentConcerns::HasStatus
end

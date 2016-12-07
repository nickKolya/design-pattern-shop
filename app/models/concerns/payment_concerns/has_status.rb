module PaymentConcerns
  module HasStatus
    extend ActiveSupport::Concern

    included do
      enum status: %i(pending processing confirmed)
      aasm :status, column: :status, enum: true do
        state :pending, initial: true
        state :processing
        state :confirmed

        event :process do
          transitions from: :pending, to: :processing
        end
        event :confirm do
          transitions from: :processing, to: :confirmed
        end
      end
    end

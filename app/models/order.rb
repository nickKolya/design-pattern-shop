class Order < ApplicationRecord
  include StatePattern::ActiveRecord
  set_initial_state OrderStates::Newmade

  belongs_to :user

  has_many :orders_items, dependent: :destroy
  has_many :items, through: :orders_items

  scope :newmade, -> { where(state: 'OrderStates::Newmade') }
  scope :canceled, -> { where(state: 'OrderStates::Canceled') }
  scope :invoiced, -> { where(state: 'OrderStates::Invoiced') }

  (OrderStates.constants - ['StateBase'.to_sym]).each do |type|
    define_method "#{type.to_s.downcase}?" do
      state_string_as_class == "OrderStates::#{type}".classify.constantize
    end
  end

  alias orig_dup dup

  def dup_with_relations
    copy = orig_dup
    copy.items = items
    copy
  end
end

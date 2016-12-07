class SubCategory < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :category

  delegate :name, to: :category, prefix: true
end

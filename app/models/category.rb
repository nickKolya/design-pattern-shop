class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :sub_categories
end

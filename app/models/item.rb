class Item < ApplicationRecord
  TYPES = [PRODUCT = 'Product'.freeze, SERVICE = 'Service'.freeze]

  has_attached_file :image,
                    styles: { medium: '512x512', small: '128x128' },
                    default_url: 'item.png'

  # Validations

  validates_attachment_content_type :image, content_type: /\Aimage/
  validates_attachment_size :image, less_than: 5.megabytes

  has_many :orders_items, dependent: :destroy
  has_many :orders, through: :orders_items
  belongs_to :category, class_name: 'SubCategory'

  delegate :name, to: :category, prefix: true, allow_nil: true
end

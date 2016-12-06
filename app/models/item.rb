class Item < ApplicationRecord
  TYPES = [PRODUCT = 'product'.freeze, SERVICE = 'service'.freeze]

  has_attached_file :image,
                    styles: { medium: '512x512', small: '128x128' },
                    default_url: 'images/:style/item.png'

  # Validations

  validates_attachment_content_type :image, content_type: /\Aimage/
  validates_attachment_size :image, less_than: 5.megabytes
  belongs_to :order
end

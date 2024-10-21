class Product < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :description
    validates :price
  end

  validates :title, uniqueness: true

  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: "must be a URL for GIF, JPG, or PNG image."
  }

  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end

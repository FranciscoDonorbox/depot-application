require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty except for image_url" do
    product = Product.new
    attributes = [ :title, :description, :price ]

    assert product.invalid?

    attributes.each do |attribute|
      assert product.errors[attribute].any?
    end
  end

  test "product price must be positive" do
    product = Product.new(
      title: "My Book Title",
      description: "yyy",
      image_url: "zzz.jpg"
    )


    product.price = 0
    product.invalid?
    assert_equal [ "must be greater than or equal to 0.01" ], product.errors[:price]

    product.price = -1
    product.invalid?
    assert_equal [ "must be greater than or equal to 0.01" ], product.errors[:price]
  end

  test "image url must be a URL for GIF, JPG, or PNG image." do
    product = Product.new(
      title: "My Book Title",
      description: "yyy",
      price: 10.00
    )

    invalid_urls = %w[
      text.txt
      image.pdf
      image.docx
    ]

    invalid_urls.each do |invalid_url|
      product.image_url = invalid_url
      assert product.invalid?
      assert_equal [ "must be a URL for GIF, JPG, or PNG image." ], product.errors[:image_url]
    end
  end
end

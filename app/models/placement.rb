class Placement < ApplicationRecord
  belongs_to :order
  # Bidirectional data referencing by inverse_of
  belongs_to :product, inverse_of: :placements

  # after_create is executed just before commit to DB
  after_create :decrement_product_quantity!
  def decrement_product_quantity!
    product.decrement!(:quantity, quantity)
  end
end

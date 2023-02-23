class Placement < ApplicationRecord
  belongs_to :order
  # Bidirectional data referencing by inverse_of
  belongs_to :product, inverse_of: :placements
end

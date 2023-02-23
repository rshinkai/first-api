class Product < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}, presence: true
  belongs_to :user

  # scope: A mechanism that allows common conditional expressions (query processing) to be defined with a name on the model side and called like methods with that name.
  scope :filter_by_title, lambda { |keyword|where('lower(title) LIKE ?', "%#{keyword.downcase}%")}
  scope :above_or_equal_to_price, lambda { |price|where('price >= ?', price)}
  scope :below_or_equal_to_price, lambda { |price|where('price <= ?', price)}
  # sort
  scope :recent, lambda {order(:updated_at)}
end

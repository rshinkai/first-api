class Product < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}, presence: true
  belongs_to :user

  has_many :placements, dependent: :destroy
  # m2m relation by through
  has_many :orders, through: :placements

  # scope: A mechanism that allows common conditional expressions (query processing) to be defined with a name on the model side and called like methods with that name.
  scope :filter_by_title, lambda { |keyword|where('lower(title) LIKE ?', "%#{keyword.downcase}%")}
  scope :above_or_equal_to_price, lambda { |price|where('price >= ?', price)}
  scope :below_or_equal_to_price, lambda { |price|where('price <= ?', price)}
  # sort
  scope :recent, lambda {order(:updated_at)}

  # return the products as an object ActiveRecord::Relation to chain other methods
  def self.search(params = {})
    products = params[:product_ids].present? ? Product.where(id:params[:product_ids]) : Product.all
    products = products.filter_by_title(params[:keyword]) if params[:keyword]
    products = products.above_or_equal_to_price(params[:min_price].to_f) if params[:min_price]
    products = products.below_or_equal_to_price(params[:max_price].to_f) if params[:max_price]
    products = products.recent if params[:recent]
    
    products
  end
end

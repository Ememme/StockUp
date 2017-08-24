class Product < ApplicationRecord
  belongs_to :storage
  belongs_to :product_type

  validates :product_name, presence: true, length: { minimum: 3 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :product_type_id, presence: true
  validate :expiration_date_cannot_be_in_the_past

    def expiration_date_cannot_be_in_the_past
      if expiration_date.present? && expiration_date < Date.today
        errors.add(:expiration_date, "can't be in the past")
      end
    end

  scope :expires_soon, -> do
    where('expiration_date =?', Date.today+3)
  end


  scope :in_stock, -> do
    where(
      'quantity > 1'
    ).order(id: :desc)
  end

  scope :running_low, -> do
    where(
      'quantity = ?', 1
    ).order(id: :desc)
  end

  scope :out_of_stock, -> do
    where(
     'quantity = ?', 0
    ).order(id: :desc)
  end

  scope :consumable, lambda { where('expiration_date > ?', Date.today) }

  scope :expires_today, lambda { where('expiration_date = ?', Date.today) }
  private

  def self.search(search)
    where("product_name LIKE ? OR expiration_date LIKE ? OR quantity LIKE ?",
          "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def low_stock_info
    if @product.quantity.zero?
      shopping_list = []
      shopping_list << @product
    else
      notification_list = []
      notification_list << @product.product_name
    end
  end

  def expires_soon
    if @product.expires_soon
      eat_quickly = []
      eat_quickly << @product
    end
  end
end

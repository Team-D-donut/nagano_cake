class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre

  has_many :ordered_items
  has_many :orders, through: :ordered_items
  has_many :cart_items

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
  def taxin_price
        price*1.1
  end
end

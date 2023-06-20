class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre

  has_many :ordered_items
  has_many :orders, through: :ordered_items

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
end

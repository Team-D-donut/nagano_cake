class Item < ApplicationRecord
  has_many :cart_items
  has_many :ordered_items  #中間テーブル
  has_many :orders, through: :ordered_items
end

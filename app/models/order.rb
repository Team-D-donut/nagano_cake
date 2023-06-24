class Order < ApplicationRecord
  belongs_to :customer #一つの会員
  has_many :ordered_items #中間テーブル
  has_many :items, through: :ordered_items  #注文には商品が多くある

# 注文ステータス 0=入金待ち, 1=入金確認, 2=製作中, 3=発送準備中, 4=発送済み
enum status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4}
# 支払い方法 0=クレジットカード, 1=銀行振込
enum payment: { credit_card: 0, transfer: 1 }
end
class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :addresses
  has_many :cart_items
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses, dependent: :destroy
  
  validates :last_name ,presence: true, length: { minimum: 1, maximum: 20 }
  validates :first_name ,presence: true, length: { minimum: 1, maximum: 20 }
  validates :kana_last_name ,presence: true, length: { minimum: 1, maximum: 20 }
  validates :kana_last_name ,presence: true, length: { minimum: 1, maximum: 20 }
  validates :post_code ,presence: true
  validates :address ,presence: true, length: { maximum: 100 }
  validates :telephone_number ,presence: true, length: { minimum: 9, maximum: 16 }
  validates :email ,presence: true, uniqueness: true
  
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
end

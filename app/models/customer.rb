class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :is_deleted, inclusion: [true, false]
end

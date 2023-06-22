# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@example.com',
  password: 'admin1'
)

Customer.create!(
  [
    {
      last_name: '名古屋',
      first_name: '京来',
      kana_last_name: 'ナゴヤ',
      kana_first_name: 'ケイキ',
      post_code: '3208501',
      address: '栃木県宇都宮市塙田1-1-20',
      telephone_number: '0286232323',
      email: 'nagoyakeikikun@gmail.com',
      password: '111111',
      is_deleted: false
    },
    {
      last_name: '横山',
      first_name: '直美',
      kana_last_name: 'ヨコウチ',
      kana_first_name: 'ナオミ',
      post_code: '0702084',
      address: '兵庫県尼崎市南武庫之荘4-1-9',
      telephone_number: '6573456556',
      email: 'naomiyokochi_51553364@gmail.com',
      password: '111111',
      is_deleted: false
    }
  ]
)
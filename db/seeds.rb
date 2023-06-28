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

Genre.create!(
  [
    {
      name: 'ケーキ'
    },
    {
      name: '焼き菓子'
    },
    {
      name: 'プリン'
    },
    {
      name: 'キャンディ'
    }
  ]
)

Item.create!(
  [
    {
      genre_id: 2,
      name: 'ブラウニー',
      introduction:
        %Q{香り高くて濃厚なチョコレートの香りが漂う、口どけの良い一品です。\n厳選した高品質なチョコレートをたっぷりと使用し、ふわっとした食感とリッチな味わいを追求しました},
      price: 500,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/brownie.jpg"),filename: "brownie.jpg")
    },
    {
      genre_id: 4,
      name: 'キャンディボトル',
      introduction:
        %Q{キャンディの魔法が詰まった、色とりどりのキャンディが詰められた瓶です。\n見た目の鮮やかさと、甘くてフルーティーな香りが広がります。\nパーティーのデコレーションやプチギフトにも最適です。},
      price: 800,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/candy.jpg"),filename: "candy.jpg")
    },
    {
      genre_id: 1,
      name: 'チョコレートケーキ',
      introduction:
        %Q{濃厚なチョコレートケーキに、口どけの良いチョコムースがたっぷりとトッピングされた贅沢な一品です。\n口に入れると、しっとりとしたケーキと滑らかなムースのハーモニーが広がります。特別な日のデザートにぴったりです。},
      price: 1500,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/chocoletecake.jpg"),filename: "chocoletecake.jpg")
    },
    {
      genre_id: 1,
      name: 'いちごチーズケーキ',
      introduction:
        %Q{鮮やかな赤いいちごが一周して乗っかった、ワンホールタイプのチーズケーキです。\n滑らかでクリーミーなチーズケーキの上に、新鮮ないちごが彩りを添えます。\n一口食べれば、ほんのりとした酸味と甘みが口いっぱいに広がります。},
      price: 1500,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/strawberry_cake.jpg"),filename: "strawberry_cake.jpg")
    },
    {
      genre_id: 2,
      name: 'チョコチップクッキー',
      introduction:
        %Q{チョコチップがたっぷり入った丸いクッキーです。\n外側はサクッとした食感で、中はしっとりとしていて、チョコレートの風味が口いっぱいに広がります。\nコーヒーや紅茶のお供にどうぞ},
      price: 500,
      is_active: true,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("db/fixtures/cookie.jpg"),filename: "cookie.jpg")
    },
  ]
)

Address.create!(
  [
    {
      customer_id: 1,
      post_code: '2539889',
      address: '神奈川県横須賀市久里浜3-2-7',
      name: '杉岡優香'
    },
    {
      customer_id: 1,
      post_code: '5739049',
      address: '大阪府箕面市如意谷3-1-7',
      name: '田中綾乃'
    },
    {
      customer_id: 2,
      post_code: '5695163',
      address: '大阪府大阪市北区豊崎4-1-6マロンアパート105',
      name: '佐藤明文'
    }
  ]
)

Order.create!(
  [
    {
      customer_id: 1,
      post_code: '3208501',
      address: '栃木県宇都宮市塙田1-1-20',
      name: '名古屋京来',
      postage: 800,
      total_price: 3500,
      payment: 0,
      status: 0
    },
    {
      customer_id: 2,
      post_code: '5695163',
      address: '大阪府大阪市北区豊崎4-1-6マロンアパート105',
      name: '佐藤明文',
      postage: 800,
      total_price: 2204,
      payment: 1,
      status: 4
    }
  ]
)

OrderedItem.create!(
  [
    {
      order_id: 1,
      item_id: 1,
      purchase_price: 1080,
      quantity: 2,
      make_status: 0
    },
    {
      order_id: 1,
      item_id: 3,
      purchase_price: 1620,
      quantity: 1,
      make_status: 0
    },
    {
      order_id: 2,
      item_id: 2,
      purchase_price: 864,
      quantity: 1,
      make_status: 3
    },
    {
      order_id: 2,
      item_id: 5,
      purchase_price: 540,
      quantity: 1,
      make_status: 3
    }
  ]
)
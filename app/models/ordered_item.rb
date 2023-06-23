class OrderedItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  # 製作ステータス 0=着手不可, 1=製作待ち, 2=製作中, 3=制作完了
  enum make_status: { production_not_possible: 0, production_pending: 1, in_production: 2, production_complete: 3 }
end

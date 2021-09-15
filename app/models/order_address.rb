class OrderAddress
  include ActiveModel::Model
  attr_accessor :hoge,:fuga...

  with_options presence: true do
    validates :code
    validates :area_id
    validates :municipality
    validates :address
    validates :building
    validates :telephone
  end

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end


# orders DBに保存はしない（モデル）コマンドなくてもいい！
# まとまって入ってくるカラム（名前が把握できていれば、バリデーション・ストロングパラメーター・ビューで設定するキー）
# validation（ストロングパラメーターのキーを使う）
# save
#     ↓  分配する役割  ↓  
# records / informations DBへの保存が必要（モデル・マイグレーションファイル）コマンドがいる！


# order_address.rb
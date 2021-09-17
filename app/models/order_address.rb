class OrderAddress
  include ActiveModel::Model
  attr_accessor :code, :municipality, :address, :building, :telephone, :area_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :telephone, format: {with: /\A\d{10,11}\z/} #message: 
    validates :area_id
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(
      code: code, 
      municipality: municipality, 
      address: address, 
      telephone: telephone,
      area_id: area_id, 
      order: order)
   end
end


# orders DBに保存はしない（モデル）コマンドなくてもいい！
# まとまって入ってくるカラム（名前が把握できていれば、バリデーション・ストロングパラメーター・ビューで設定するキー）
# validation（ストロングパラメーターのキーを使う）
# save
#     ↓  分配する役割  ↓  
# records / informations DBへの保存が必要（モデル・マイグレーションファイル）コマンドがいる！


# order_address.rb
class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users,dependent: :destroy
                                        #roomに紐づいているユーザー情報の削除なので、ここでは中間テーブルから該当するレコードの削除となる
  has_many :messages,dependent: :destroy
  validates :name, presence: true
end

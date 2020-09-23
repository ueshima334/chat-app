class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
          # ↑スペース空けないとエラー発生する
  has_one_attached :image # active strageの画像と紐づけることができる。
  #imageカラムは存在しないが、この記述をすることでuserモデルにimageカラムを作成せずとも画像と紐付けができる（有能）
  validates :content, presence: true
end

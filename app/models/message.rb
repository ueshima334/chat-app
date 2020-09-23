class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
          # ↑スペース空けないとエラー発生する
  has_one_attached :image # active strageと1対1のアソシエーション
  validates :content, presence: true
end

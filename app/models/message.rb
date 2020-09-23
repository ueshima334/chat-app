class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
          # ↑スペース空けないとエラー発生する
  validates :content, presence: true
end

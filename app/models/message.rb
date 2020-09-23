class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
          # ↑スペース空けないとエラー発生する
  has_one_attached :image # active strageの画像と紐づけることができる。
  #imageカラムは存在しないが、この記述をすることでuserモデルにimageカラムを作成せずとも画像と紐付けができる（有能）
  validates :content, presence: true、unless: :was_attached?
                                      #unless 以下の条件式に当てはまらない場合、バリデーションを適用する。
                                      #画像が添付されているか？の検証の結果が否の場合、「テキストの空欄があるとデータを保存できない」というバリデーションが適用される。                                    
  def was_attached?
    self.image.attached?
         #image.attached?で画像が添付されているかどうかの検証ができる
  end

end

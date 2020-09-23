class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
          # ↑スペース空けないとエラー発生する
  has_one_attached :image # active strageの画像と紐づけることができる。
  #imageカラムは存在しないが、この記述をすることでuserモデルにimageカラムを作成せずとも画像と紐付けができる（有能）
  validates :content, presence: true、unless: :was_attached?
                                      #unless 以下の条件式に当てはまらない場合、バリデーションを適用する。
  #was_attached?は、imageが紐づいているか？(画像が添付されているか？)を確認しているので、添付されていない場合のみ、「テキストの空欄があるとデータを保存できない」というバリデーションが適用される。                                    
  def was_attached?
    self.image.attached?
  end

end

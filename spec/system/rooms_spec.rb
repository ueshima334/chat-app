require 'rails_helper'

RSpec.describe "チャットルームの削除機能", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されていること' do
    # サインインする
    sign_in(@room_user.user)

    # 作成されたチャットルームへ遷移する
    click_on(@room_user.room.name)
    # メッセージ情報を5つDBに追加する
    FactoryBot.create_list(:message, 5, room_id: @room_user.room.id, user_id: @room_user.user.id) #@room_user.user.idはbeforeで@room_userを作成した際に同時に生成されたユーザーのidである

               #create_listでmessageテーブルのレコードをまとめて生成できる。
                                                  #messageと紐づいたユーザーとチャットルームを中間テーブルのカラムに入るよう記述している
              #create_list(作成したいファクトリー名,作成したいインスタンス数)


    # 「チャットを終了する」ボタンをクリックすることで、作成した5つのメッセージが削除されていることを確認する
     expect{click_on('チャットを終了する')}.to change{Message.count}.by(-5)
    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path

  end
end
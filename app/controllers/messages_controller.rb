class MessagesController < ApplicationController
  def index
     @message = Message.new
     @room = Room.find(params[:room_id])
     @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
               #↑チャットルームに紐づいたmessageインスタンスを生成する必要がある為、このような記述になる。@roomは一行上で定義しているやつ
               # 同時にストロングパラメータを適用したparamsをnewメソッドの引数にして生成したインスタンスに代入している。
    if @message.save
        redirect_to room_messages_path(@room)
      else
       @messages = @room.messages.includes(:user)
       #renderでindexビューに飛ばす際に、投稿に失敗した@messagesの情報を保持することができるが、@messagesが定義されてないとエラーとなる為、indexコントローラで定義している内容をここでも記述している。
       render :index
    end
  end

private

def message_params
  params.require(:message).permit(:content).merge(user_id: current_user.id)
                                            #↑ room_idはparamsに入っているがuserとも紐づける必要があるのでcurrent_user.idをmergeして紐づける
end

end


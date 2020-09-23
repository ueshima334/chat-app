class MessagesController < ApplicationController
  def index
     @message = Message.new
     @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
               #↑チャットルームに紐づいたmessageインスタンスを生成する必要がある為、このような記述になる。
               # 同時にストロングパラメータを適用したparamsをnewメソッドの引数にして生成したインスタンスに代入している。
    @message.save
  end

private

def message_params
  params.require(:message).permit(:content).merge(user_id: current_user.id)
                                            #↑ room_idはparamsに入っているがuserとも紐づける必要があるのでcurrent_user.idをmergeして紐づける
end

end


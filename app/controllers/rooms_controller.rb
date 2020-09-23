class RoomsController < ApplicationController
  def index
  end
  
  def new
    @room = Room.new
  end

  def create
    #params={"room"=>{"name"=>"ルーム名", "user_ids"=>["1", "2"]}, "commit"=>"Create Room", "controller"=>"rooms", "action"=>"create"}} 
                                          #↑ この形にして昼間テーブルに保存するようにしている。
              #↑ select要素でキーがroom[user_ids][]でoptionキーのvalue(値)がuser.idだと、paramsは↑のようになる。キーがroom[user][]でも形は一緒
    @room = Room.new(room_params)
    if @room.save
       redirect_to root_path
    else
       render :new #保存がうまくいかなかった場合はnew.html.erbにページを戻す
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
                                        #↑ 配列に対して保存を許可したい場合はこのような記載になる
  end

end


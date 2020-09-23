class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    #params={"room"=>{"name"=>"ルーム名", "user_ids"=>["1", "2"]}, "commit"=>"Create Room", "controller"=>"rooms", "action"=>"create"}} 
                                          #↑ この形にして昼間テーブルに保存するようにしている。
              #↑ select要素でキーがroom[user_ids][]でoptionキーのvalue(値)がuser.idだと、paramsは↑のようになる。キーがroom[user][]でも形は一緒
  end
end

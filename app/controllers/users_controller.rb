class UsersController < ApplicationController
  def edit
  end

  def update
  #params={"user"=>{"name"=>"長嶋", "email"=>"nagashima@nagashima"}, "commit"=>"Update", "controller"=>"users", "action"=>"update", "id"=>"1"}} 
  if current_user.update(user_params)
    redirect_to root_path
   else
     render :edit #editアクションを指定しているのでeditのビューが表示される。
   end
   end


  private

  def user_params
  params.require(:user).permit(:name,:email)

  end
end
class ChatsController < ApplicationController
  before_action :set_room
  def create
    if UserRoom.where(user_id: current_user.id, room_id: @room.id)
      @chat = Chat.new(chat_params)
      @chat.save
    else
      flash[:alert] = "メッセージの送信に失敗しました"
    end
    # redirect_to "/rooms/#{@chat.room_id}"
  end  
  private
  def chat_params
    params.require(:chat).permit(:user_id, :room_id, :content).merge(user_id: current_user.id)
  end
  def set_room
    @room = Room.find(params[:chat][:room_id])
  end
end
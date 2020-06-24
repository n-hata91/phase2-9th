class ChatsController < ApplicationController
  def create
    @room = Room.find_by(id: params[:id])
    if UserRoom.where(user_id: current_user.id, room_id: @room)
      @chat = Chat.new(chat_params)
      @chat.save
    else
      flash[:alert] = "メッセージの送信に失敗しました"
    end
  end  

  def show
    @room = Room.find(params[:id])
    if UserRoom.where(user_id: current_user.id,room_id: @room.id).present?
      @chats = @room.chats
      @chat = Chat.new
      @user_rooms = @room.user_rooms
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:user_id, :room_id, :content).merge(user_id: current_user.id)
  end
end
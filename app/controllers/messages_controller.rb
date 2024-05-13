class MessagesController < ApplicationController
  def new
    @room = Room.find(params[:room_id])
    @messages = Message.all
  end
  def create
    # debugger
    @current_user = current_user
    @room = Room.find(params[:room_id])
    @message = @room.messages.create(content: msg_params[:content], user_id: @current_user.id)
  end
  

  private

  def msg_params
    params.require(:message).permit(:content)
  end
end
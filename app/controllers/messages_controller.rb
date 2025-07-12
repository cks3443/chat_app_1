class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @conversation = Conversation.find(params[:conversation_id])
    # TODO
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to conversation_path(@conversation)
    else
      flash[:alert] = "메시지를 보낼 수 없습니다."
      redirect_to conversation_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

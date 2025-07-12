class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user = current_user

    if @message.save
      ActionCable.server.broadcast("conversation_#{@conversation.id}", message: render_to_string(partial: "messages/message", locals: { message: @message }))
    else
      flash[:alert] = "메시지를 전송에 실패했습니다."
    end

    head :no_content
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
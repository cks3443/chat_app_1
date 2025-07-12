class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.where("user1_id = ? OR user2_id = ?", current_user.id, current_user.id)
  end

  def show
    @conversation = Conversation.find(params[:id])

    redirect_to conversations_path unless @conversation.user1 == current_user || @conversation.user2 == current_user

    @message=Message.new
    @messages=@conversation.messages.order(created_at: :asc)
  end

  def create
    if (conversation = Conversation.between(current_user.id, params[:user_id]))
      redirect_to conversation_path(conversation)
    else
      @conversation = Conversation.new(user1_id: current_user.id, user2_id: params[:user_id])
      if @conversation.save
        redirect_to conversation_path(@conversation)
      else
        flash[:alert]="채팅방 생성에 실패했습니다."
        redirect_back(fallback_location: users_path)
      end
    end
  end
end

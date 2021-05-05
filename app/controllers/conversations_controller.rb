class ConversationsController < ApplicationController

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.sender_id = current_account.id
    @conversation.messages.first.account_id = current_account.id

    if @conversation.save

    else

    end
  end

  def update
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      format.js {
        if @conversation.update!(conversation_params)
          @messages = @conversation.messages
          render "browse/conversation_messages"

        else

        end
      }
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:recipient_id, messages_attributes: [:body, :account_id])
  end

end

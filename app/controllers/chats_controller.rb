class ChatsController < ApplicationController

  #--------------------------------------------------------------
  def showAppChats
    render json: @chats = Chat.select(:id, :messages_count)
                              .where(application_token: params[:application_token])
                              .order(updated_at: :desc)
  end

  #--------------------------------------------------------------
  def createNewChat
    CreateNewChatJob.perform_later(params[:application_token])
    render status: 200
  end

  #--------------------------------------------------------------
end

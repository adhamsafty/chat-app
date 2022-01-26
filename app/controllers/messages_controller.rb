class MessagesController < ApplicationController
  #--------------------------------------------------------------
  def getChatMessages
    render json: @messages = Message.select(:id, :body)
                              .where(application_token: params[:application_token], chat_id: params[:chat_id])
                              .order(created_at: :desc)
  end

  #--------------------------------------------------------------
  def addNewMessage
    AddNewMessageJob.perform_later(params[:application_token],params[:chat_id],params[:body])
    render status: 200
  end
end

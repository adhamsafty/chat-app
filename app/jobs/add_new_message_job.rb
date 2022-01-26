class AddNewMessageJob < ApplicationJob
  queue_as :send_message

  def perform(application_token, chat_id, body)
    puts('Send message triggered...')
    chat = Chat.find_by(application_token: application_token, id: chat_id)
    puts chat
    if chat != nil
      message_id = chat.messages_count + 1
      message = Message.new(id: message_id, chat_id: chat_id, application_token: application_token, body: body)
      puts message
      if message.save
        chat.messages_count += 1
        chat.save
        #index in elasticsearch
      else
        puts('Error saving message number #message_id for chat #chat_id in app with token #application_token')
      end
    else
      puts('Cannot find chat with id #chat_id and app token #application_token')
    end
  end
end

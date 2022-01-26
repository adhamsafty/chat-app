class CreateNewChatJob < ApplicationJob
  queue_as :create_chat

  def perform(application_token)
    puts('Create chat triggered...')
    application = Application.find(application_token)
    if application != nil
      chat_id = application.chats_count + 1
      chat = Chat.new(id: chat_id, application_token: application_token, messages_count: 0)
      if chat.save
        application.chats_count += 1
        application.save
      else
        puts('Error saving chat number #chat_id for token #application_token')
      end
    else
      puts('Cannot find application with token #application_token')
    end
  end
end

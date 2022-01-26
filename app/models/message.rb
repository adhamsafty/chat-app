require 'elasticsearch/model'

class Message < ApplicationRecord
    include Elasticsearch::Model
    belongs_to :chat, primary_key: 'id', foreign_key: 'chat_id'
    belongs_to :application, primary_key: 'token', foreign_key: 'application_token'
end

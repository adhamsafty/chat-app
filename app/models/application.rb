class Application < ApplicationRecord
    self.primary_key = 'token'
    has_many :chats, primary_key: 'token', foreign_key: 'application_token'
end

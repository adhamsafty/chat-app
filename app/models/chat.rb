class Chat < ApplicationRecord
    has_many :messages
    belongs_to :application, primary_key: 'token', foreign_key: 'application_token'
end

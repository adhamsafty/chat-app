class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats, id: false do |t|
      t.integer :id
      t.string :application_token
      t.integer :messages_count

      t.timestamps
    end
    add_foreign_key :chats, :applications, column: :application_token, primary_key: 'token'
    add_index :chats, [:id, :application_token], unique: true
  end
end

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: false do |t|
      t.integer :id
      t.string :application_token, foreign_key: true
      t.integer :chat_id, foreign_key: true
      t.string :body

      t.timestamps
    end
    add_index :messages, [:id, :chat_id, :application_token], unique: true
  end
end

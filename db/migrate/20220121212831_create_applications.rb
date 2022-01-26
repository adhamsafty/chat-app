class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications, id: false do |t|
      t.string :token, primary_key: true
      t.string :name
      t.integer :chats_count

      t.timestamps
    end
  end
end

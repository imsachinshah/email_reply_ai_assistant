class CreateEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :emails do |t|
      t.string :sender
      t.string :recipient
      t.string :subject
      t.text :body
      t.string :thread_id

      t.timestamps
    end
  end
end

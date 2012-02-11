class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.boolean :public
      t.integer :identity_id
      t.integer :user_id
      t.integer	:topic_id

      t.timestamps
    end
  end
end

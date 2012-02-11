class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :identity_type
      t.string :identity_value
	  t.integer :user_id
	  
      t.timestamps
    end
  end
end

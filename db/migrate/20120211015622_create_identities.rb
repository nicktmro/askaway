class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :identityType
      t.string :username

      t.timestamps
    end
  end
end

class CreateBlockedUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :blocked_users do |t|
      t.references :for_user, null: false, foreign_key: {to_table: :users}
      t.references :blocked_user_id, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end

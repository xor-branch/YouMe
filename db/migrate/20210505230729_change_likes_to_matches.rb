class ChangeLikesToMatches < ActiveRecord::Migration[5.2]
  def up
    rename_column :likes, :account_id, :account_1
    rename_column :likes, :liked_account_id, :account_2
    add_column :likes, :account_1_approves, :boolean
    add_column :likes, :account_2_approves, :boolean

    rename_table :likes, :matches
  end
  def down
    rename_table :matches, :likes

    rename_column :likes, :account_1, :account_id
    rename_column :likes, :account_2, :liked_account_id
    rename_column :likes, :account_1_approves
    rename_column :likes, :account_2_approves

  end
end

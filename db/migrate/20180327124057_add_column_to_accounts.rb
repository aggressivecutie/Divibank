class AddColumnToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :sender_acc_id, :string
    add_column :accounts, :recipient_acc_id, :string
  end
end

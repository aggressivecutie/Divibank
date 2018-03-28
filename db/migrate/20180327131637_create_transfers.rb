class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.decimal :amount
      t.string :currency
      t.decimal :conversion_rate
      t.string :transfer_number
      t.references :sender_acc
      t.references :recipient_acc
      t.timestamps
    end

    add_foreign_key :transfers,
                    :accounts,
                    column: :sender_acc_id, primary_key: :acc_number,
                    unique: true

    add_foreign_key :transfers,
                    :accounts,
                    column: :recipient_acc_id, primary_key: :acc_number,
                    unique: true
  end
end

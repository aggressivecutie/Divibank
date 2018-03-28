class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :acc_number, unique: true
      t.decimal :balance

      t.timestamps
    end
  end
end

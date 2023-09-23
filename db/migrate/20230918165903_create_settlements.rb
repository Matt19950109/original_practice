class CreateSettlements < ActiveRecord::Migration[7.0]
  def change
    create_table :settlements do |t|
      t.string  :payment
      t.integer :bank_account_id
      t.timestamps
    end
  end
end

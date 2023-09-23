class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.integer :amount_price
      t.string  :bank_account
      t.timestamps
    end
  end
end

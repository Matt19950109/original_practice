class CreateSettlements < ActiveRecord::Migration[7.0]
  def change
    create_table :settlements do |t|
      t.string  :payment
      t.references :income, null: false, foreign_key: true
      t.timestamps
    end
  end
end

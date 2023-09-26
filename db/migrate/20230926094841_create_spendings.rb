class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.integer  :price, null: false
      t.string   :item_name, null: false
      t.references :settlement, null: false, foreign_key: true
      t.datetime   :start_time, null: false
      t.timestamps
    end
  end
end

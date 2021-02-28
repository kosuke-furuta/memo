class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.string :product_name, limit: 30, null: false
      t.string :order_number, limit: 6, null: false
      t.datetime :delivery_date
      t.integer :quantity
      t.string :process
      t.text :remarks
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :taskmemos, [:user_id, :created_at]
  end
end

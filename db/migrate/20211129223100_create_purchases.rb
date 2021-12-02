class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.string :name
      t.float :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

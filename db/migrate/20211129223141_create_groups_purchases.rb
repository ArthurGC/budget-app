class CreateGroupsPurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :groups_purchases, :id => false do |t|
      t.references :group
      t.references :purchase
    end

    add_index :groups_purchases, [:group_id, :purchase_id],
      name: "groups_purchases_index",
      unique: true
  end
end

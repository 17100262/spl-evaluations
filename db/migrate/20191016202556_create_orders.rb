class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true
      t.boolean :paid
      t.string :stripe_charge_id
      t.decimal :amount

      t.timestamps
    end
  end
end

class CreateSubscription < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.string :name, null: false
      t.string :telegram, null: false
      t.string :site, null: false
      t.timestamps
    end
  end
end

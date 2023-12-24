class CreateFollower < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.timestamps
      t.references :subscriber, reference: :users
      t.references :publisher, reference: :users
    end
  end
end

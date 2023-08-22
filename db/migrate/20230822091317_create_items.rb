class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :starting_price
      t.decimal :current_bid
      t.datetime :end_time

      t.timestamps
    end
  end
end

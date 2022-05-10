class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :name, unique: true
      t.references :bearer, null: false, foreign_key: true
      t.timestamp :deleted_at

      t.timestamps
    end

    add_index :stocks, [:name, :bearer_id], unique: true
  end
end

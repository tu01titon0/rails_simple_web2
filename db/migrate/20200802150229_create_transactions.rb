class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :title
      t.decimal :amount
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end

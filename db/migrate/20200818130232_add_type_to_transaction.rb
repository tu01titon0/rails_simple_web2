class AddTypeToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :transaction_type, :integer , default: 0
  end
end

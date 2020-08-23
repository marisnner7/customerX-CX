class ChangeDataTypeForTelephone < ActiveRecord::Migration[6.0]
  def change
    change_column :customers, :telephone, :string
  end
end

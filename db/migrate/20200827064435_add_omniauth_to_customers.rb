class AddOmniauthToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :provider, :string
    add_column :customers, :uid, :string
    add_column :customers, :facebook_picture_url, :string
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :token, :string
    add_column :customers, :token_expiry, :datetime
  end
end

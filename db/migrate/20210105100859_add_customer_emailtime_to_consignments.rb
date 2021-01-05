class AddCustomerEmailtimeToConsignments < ActiveRecord::Migration[6.0]
  def change
    add_column :consignments, :customer_email, :string
  end
end

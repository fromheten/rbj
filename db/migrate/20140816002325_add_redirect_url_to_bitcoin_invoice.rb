class AddRedirectUrlToBitcoinInvoice < ActiveRecord::Migration
  def change
    add_column :bitcoin_invoices, :redirect_url, :string
  end
end

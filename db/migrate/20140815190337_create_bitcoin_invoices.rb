class CreateBitcoinInvoices < ActiveRecord::Migration
  def change
    create_table :bitcoin_invoices do |t|
      t.references :job, index: true
      t.string :bitpay_id
      t.float :price
      t.string :currency
      t.string :notificationEmail

      t.timestamps
    end
  end
end

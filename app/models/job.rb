class Job < ActiveRecord::Base
  has_one :bitcoin_invoice
  accepts_nested_attributes_for :bitcoin_invoice
  after_create :create_invoice, :default_values

  def check_payment
    self.paid = self.bitcoin_invoice.is_paid?
  end

  private

  def default_values
    self.paid = false
  end

  def create_invoice(arguments = {})
    self.bitcoin_invoice = BitcoinInvoice.create({
      price: 0.01,
      currency: 'USD',
      notificationEmail: "josefsson.martin@gmail.com",
      job_id: id
    })
    puts self.bitcoin_invoice.bitpay_invoice.class
  end
end

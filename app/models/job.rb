class Job < ActiveRecord::Base
  has_one :bitcoin_invoice
  accepts_nested_attributes_for :bitcoin_invoice
  after_create :create_invoice

  private
  def create_invoice(arguments = {})
    self.bitcoin_invoice = BitcoinInvoice.create({
      price: 0.01,
      currency: 'USD',
      notificationEmail: "josefsson.martin@gmail.com"
    })
  end
end

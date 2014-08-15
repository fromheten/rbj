class Job < ActiveRecord::Base
  has_one :bitcoin_invoice
  accepts_nested_attributes_for :bitcoin_invoice

  def initialize(arguments = {})
    super
    self.bitcoin_invoice = BitcoinInvoice.create()
    puts "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]"
    puts self.bitcoin_invoice.inspect
    puts "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]"
  end
end

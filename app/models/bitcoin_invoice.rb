class BitcoinInvoice < ActiveRecord::Base
  belongs_to :job
  # validates_presence_of :job
  attr_reader :bitpay_id, :bitpay_url
  attr_accessor :bitpay_invoice

  def initialize(arguments = {}, options = {})
    super
    # @bitpay_client = BitPay::Client.new 'OWR0fNlPRA7TphMICYWFqmNnxLAaa22jMhBsUqtew' #REAL ONE
    # @bitpay_client = BitPay::Client.new 'vOT1Eq1ULYBWRS35wronKtHMbYYOSXDgLsL6x2U44' #TEST ONE
    self.bitpay_invoice = BitcoinInvoice.bitpay_client.post('invoice', {
      price: 0.01,
      currency: 'USD',
      #FIXME
      redirectURL: "http://example.org/jobs/#{self.job_id}"
    })
    self.bitpay_id = @bitpay_invoice["id"]
    self.save
  end

  def self.bitpay_client
    # BitPay::Client.new 'OWR0fNlPRA7TphMICYWFqmNnxLAaa22jMhBsUqtew' #REAL ONE
    BitPay::Client.new 'vOT1Eq1ULYBWRS35wronKtHMbYYOSXDgLsL6x2U44' #TEST ONE
  end

  def is_paid?
    invoice = BitcoinInvoice.bitpay_client.get("invoice/#{self.bitpay_id}")
    status = invoice["status"]
    puts
    puts "[[[[[[[[ is paid? ]]]]]]]]"
    puts invoice, status
    puts BitcoinInvoice.bitpay_client.inspect
    puts "[[[[[[[[[[[[]]]]]]]]]]]]"
    puts
    Rails.logger.debug  "Checking payment status: #{status}"
    if (status == 'confirmed' || status == 'paid' || status == 'complete')
      return true
    else
      return false
    end
  end
end

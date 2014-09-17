class BitcoinInvoice < ActiveRecord::Base
  belongs_to :job
  # validates_presence_of :job
  attr_reader :bitpay_id, :bitpay_url
  attr_accessor :bitpay_invoice

  def initialize(arguments = {}, options = {})
    super
    # @bitpay_client = BitPay::Client.new 'OWR0fNlPRA7TphMICYWFqmNnxLAaa22jMhBsUqtew' #REAL ONE
    @bitpay_client = BitPay::Client.new 'vOT1Eq1ULYBWRS35wronKtHMbYYOSXDgLsL6x2U44' #TEST ONE
    @bitpay_invoice = @bitpay_client.post('invoice', {
      price: 0.01,
      currency: 'USD',
      #FIXME
      redirectURL: "http://google.com/jobs/#{self.job_id}"
    })
    self.bitpay_id = @bitpay_invoice[:id]
    self.save
  end

  def is_paid?
    status = @bitpay_client.get("invoice/#{@bitpay_invoice["id"]}")["status"]
    if status == 'paid'
      return true
    else
      return false
    end
  end
end

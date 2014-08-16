class BitcoinInvoice < ActiveRecord::Base
  belongs_to :job
  # validates_presence_of :job
  attr_reader :bitpay_id, :bitpay_url
  attr_accessor :bitpay_invoice
  after_create :create_bitpay_objects

  def create_bitpay_objects()
    # @bitpay_client = BitPay::Client.new 'OWR0fNlPRA7TphMICYWFqmNnxLAaa22jMhBsUqtew' #REAL ONE
    @bitpay_client = BitPay::Client.new 'vOT1Eq1ULYBWRS35wronKtHMbYYOSXDgLsL6x2U44' #TEST ONE
    @bitpay_invoice = @bitpay_client.post('invoice', {
      price: 0.01,
      currency: 'USD',
      #FIXME
      redirectURL: "http://example.org/jobs/#{job_id}"
    })
    @bitpay_id = @bitpay_invoice["id"]
  end

  def is_paid?
    invoice = @bitpay_client.get("invoice/#{@bitpay_id}")
    if invoice["status"] == 'paid'
      return true
    else
      return false
    end
  end
end

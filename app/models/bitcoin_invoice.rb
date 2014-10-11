class BitcoinInvoice < ActiveRecord::Base
  belongs_to :job
  # validates_presence_of :job
  attr_reader :bitpay_id, :bitpay_url
  attr_accessor :bitpay_invoice

  def initialize(arguments = {}, options = {})
    super
    bitpay_client = BitPay::Client.new('vOT1Eq1ULYBWRS35wronKtHMbYYOSXDgLsL6x2U44' , {api_uri: "https://test.bitpay.com/api"}) #TEST ONE

    self.bitpay_invoice = bitpay_client.post('invoice', {
      price: price,
      currency: 'USD',
      redirectURL: "http://remotebitcoinjobs.com/jobs/#{self.job_id}"
    })
    self.bitpay_id = @bitpay_invoice["id"]
    puts "[[[[[[[[[[]]]]]]]]]]"
    puts self.inspect
    puts self.bitpay_invoice.inspect
    self.save
  end

  def self.bitpay_client
    if Rails.env.production?
      BitPay::Client.new 'OWR0fNlPRA7TphMICYWFqmNnxLAaa22jMhBsUqtew' #REAL ONE
    else
      BitPay::Client.new('vOT1Eq1ULYBWRS35wronKtHMbYYOSXDgLsL6x2U44' , {api_uri: "https://test.bitpay.com/api"}) #TEST ONE
    end
  end

  def is_paid?
    invoice = BitcoinInvoice.bitpay_client.get("invoice/#{attributes['bitpay_id']}")
    status = invoice["status"]

    if (status == 'confirmed' || status == 'paid' || status == 'complete')
      return true
    else
      return false
    end
  end

  def is_expired?
    invoice = BitcoinInvoice.bitpay_client.get("invoice/#{attributes['bitpay_id']}")
    status = invoice["status"]

    return true if status == "expired" else return false
  end
end

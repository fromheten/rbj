require 'rails_helper'

RSpec.describe BitcoinInvoice, :type => :model do
  before do
    @job = Job.create()
  end

  it 'should know if the invoice is paid' do
    expect(@job.bitcoin_invoice.is_paid?).to eq(false)
  end
end

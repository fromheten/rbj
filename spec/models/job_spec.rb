require 'rails_helper'

RSpec.describe Job, :type => :model do
  before do
    @job = Job.create({title: "Målare",
                       headquarters: "Berlin, De",
                       job_description: "Paint a house"
    })
  end

  it 'should have a bitcoin_invoice' do
    expect(@job.bitcoin_invoice.class).to eq(BitcoinInvoice)
  end

  it 'should not be paid when it is just created' do
    expect(@job.bitcoin_invoice.is_paid?).to eq(false)
  end
end

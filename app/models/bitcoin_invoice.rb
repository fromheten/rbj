class BitcoinInvoice < ActiveRecord::Base
  belongs_to :job
  validates_presence_of :job
end

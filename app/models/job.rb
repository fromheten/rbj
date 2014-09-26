class Job < ActiveRecord::Base
  has_one :bitcoin_invoice
  accepts_nested_attributes_for :bitcoin_invoice
  after_create :create_invoice

  # validates :email, format: { with: /.+@.+\..+/, message: "Please enter a valid email address" }
  # validates :title, :headquarters, :job_description, :how_to_apply, :company_name, :company_url, presence: true

  private
  def create_invoice(arguments = {})
    self.bitcoin_invoice = BitcoinInvoice.create({
      job_id: id,
      price: 0.01,
      currency: 'USD',
      notificationEmail: "josefsson.martin@gmail.com"
    })
  end
end

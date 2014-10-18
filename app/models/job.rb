class Job < ActiveRecord::Base
  has_one :bitcoin_invoice
  accepts_nested_attributes_for :bitcoin_invoice
  after_create :create_invoice

  default_scope { order(created_at: :desc) } # Sort newest first
  # default_scope { group(:highlight).order(created_at: :desc)} # Sort newest first

  validates :email, format: { with: /.+@.+\..+/, message: "Please enter a valid email address" }
  validates :title, :headquarters, :job_description, :how_to_apply, :company_name, :company_url, presence: true

  private
  def create_invoice(arguments = {})
    if attributes["highlight"]
      price = 199 + 49
    else
      price = 199
    end
    if Rails.env.development?
      puts "debug: when developing price is 99% off. That's why life on testnet is freaking sweeet"
      price = price * 0.01
    end

    self.bitcoin_invoice = BitcoinInvoice.create({
      job_id: id,
      price: price,
      currency: 'USD',
      notificationEmail: email
    })
  end
end

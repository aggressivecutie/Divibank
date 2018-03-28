class Transfer < ApplicationRecord
  # include HTTParty
  #
  # # Setting URL
  # url = "https://divipay.com/secure/currency/AUD/"
  # uri = URI(url)
  # response = HTTParty.get(uri)
  # response_obj = JSON.parse(response)

  belongs_to :sender_acc,
             class_name: 'Account',
             foreign_key: 'sender_acc_id',
             inverse_of: 'sent_transfers'
             # primary_key: :acc_number
  belongs_to :recipient_acc,
             class_name: 'Account',
             foreign_key: 'recipient_acc_id',
             inverse_of: 'received_transfers'
             # primary_key: :acc_number


  validates :amount, presence: true, numericality: true
  validates :currency, presence: true
  validates :conversion_rate, presence: true
  validates :sender_acc_id, presence: true
  validates :recipient_acc_id, presence: true
  validates :transfer_number, presence: true, uniqueness: true

  before_validation :load_defaults

  before_save :find_account_numbers

  def load_defaults
    if self.new_record?
      self.transfer_number = SecureRandom.uuid
    end
  end

  def currency
    
  end


  def rate
    HTTParty.get("https://divipay.com/secure/currency/#{currency}/")
  end

end

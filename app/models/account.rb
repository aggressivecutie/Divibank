class Account < ApplicationRecord
  has_many :sent_transfers,
           class_name: 'Transfers',
           foreign_key: 'sender_acc_id',
           inverse_of: 'sender_acc'

  has_many :received_transfers,
           class_name: 'Transfers',
           foreign_key: 'recipient_acc_id',
           inverse_of: 'recipient_acc'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :acc_number, presence: true, uniqueness: true, length: { is: 9}
  validates :balance, presence: true

  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      self.balance = 100.00
      self.acc_number = SecureRandom.random_number(1000000000)
    end
  end

end

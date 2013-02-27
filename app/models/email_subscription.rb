class EmailSubscription < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :token, uniqueness: true

  scope :confirmed, -> { where(confirmed: true) }

  def self.new_unconfirmed_subscription(email)
    token = generate_token
    new(email: email, token: token, confirmed: false)
  end

  def self.subscribers
    EmailSubscription.confirmed.pluck(:email)
  end

  def confirm_subscription(token)
    valid_token?(token) && self.update(confirmed: true)
  end

  def send_confirmation
    SubscriptionMailer.subscription_confirmation(self).deliver
  end

  def valid_token?(token)
    self.token == token
  end

  private

    def self.generate_token
      SecureRandom.urlsafe_base64
    end
end

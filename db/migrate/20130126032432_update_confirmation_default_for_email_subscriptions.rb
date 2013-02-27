class UpdateConfirmationDefaultForEmailSubscriptions < ActiveRecord::Migration
  def self.up
    change_column_default :email_subscriptions, :confirmed, false
  end

  def self.down
    change_column_default :email_subscriptions, :confirmed, true
  end
end

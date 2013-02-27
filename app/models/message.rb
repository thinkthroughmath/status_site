class Message < ActiveRecord::Base
  def self.next_message
    next_messages.first
  end

  def self.upcoming_message
    if next_message && next_message.within_two_days?
      next_message
    else
      nil
    end
  end

  def self.next_messages
    where("start_date >= ?", Date.current)
  end

  def within_two_days?
    start_date >= Date.current &&
      start_date <= ( Date.current + 2.days )
  end
end

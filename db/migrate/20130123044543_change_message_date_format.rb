class ChangeMessageDateFormat < ActiveRecord::Migration
  def self.up
    change_column :messages, :start_date, :date
  end

  def self.down
    change_column :messages, :start_date, :datetime
  end
end

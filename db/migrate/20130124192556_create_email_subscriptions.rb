class CreateEmailSubscriptions < ActiveRecord::Migration
  def change
    create_table :email_subscriptions do |t|
      t.string :email
      t.string :token
      t.boolean :confirmed, default: true
      t.timestamps
    end
  end
end
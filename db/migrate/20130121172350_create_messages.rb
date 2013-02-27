class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text      :body
      t.datetime  :start_date

      t.timestamps
    end
  end
end

class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :title
      t.text :body
      t.integer :issue_id

      t.timestamps
    end

    add_index :updates, :issue_id
  end
end

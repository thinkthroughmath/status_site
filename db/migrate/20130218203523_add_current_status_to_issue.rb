class AddCurrentStatusToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :current_site_status, :string
  end
end

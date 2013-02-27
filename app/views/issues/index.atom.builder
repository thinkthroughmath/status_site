atom_feed do |feed|
  feed.title "Upcoming Maintaince"
  @issues.each do |issue|
    feed.entry issue do |entry|
      entry.title   issue.title
      entry.content issue.body
      issue.updates.each do |update|
        entry.update do |update_entry|
          update_entry.title update.title
          update_entry.body  update.body
        end
      end
    end
  end
end
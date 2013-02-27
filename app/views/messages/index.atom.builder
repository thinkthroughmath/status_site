atom_feed do |feed|
  feed.title "Upcoming Maintaince"
  @messages.each do |message|
    feed.entry message do |entry|
      entry.title message.start_date
      entry.content message.body
    end
  end
end
class PublicDashboardsController < ApplicationController

  def index
    @issues = Issue.latest_first
    @current_status = SiteStatus.new(@issues.first).current_status
    @next_message = Message.next_message
    @stats = NewRelicStats.new(
      api_key:          ENV['NEW_RELIC_API_KEY'],
      application_name: ENV['NEW_RELIC_APPLICATION_NAME']
    )
  end

end

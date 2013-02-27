class SiteStatus

  STATUSES = {
    yellow: 'Performance impact',
    red:    'System outage',
    green:  'System normal'
  }

  attr_reader :latest_issue

  def initialize(latest_issue)
    @latest_issue = latest_issue
  end

  def current_status
    if display_status?
      STATUSES[latest_issue.current_site_status.to_sym]
    else
      STATUSES[:green]
    end
  end

  def display_status?
    latest_issue && latest_issue.current_site_status && !latest_issue.resolved?
  end

  def self.status_options
    STATUSES.map do |key, value|
      [value, key]
    end
  end

end
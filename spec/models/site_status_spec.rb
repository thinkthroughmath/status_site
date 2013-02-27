require 'spec_helper'

describe SiteStatus do
  it "returns a green status when no issue is passed in" do
    site_status = SiteStatus.new(nil)

    site_status.current_status.should == SiteStatus::STATUSES[:green]
  end

  it "returns the latest issue's status when it is not resolved" do
    issue = mock_model(Issue)
    issue.should_receive(:current_site_status).exactly(2).and_return(:yellow)
    issue.should_receive(:resolved?).and_return(false)
    site_status = SiteStatus.new(issue)

    site_status.current_status.should == SiteStatus::STATUSES[:yellow]
  end

  it "returns a green status when the latest issue is resolved" do
    issue = mock_model(Issue)
    issue.should_receive(:current_site_status).and_return(:yellow)
    issue.should_receive(:resolved?).and_return(true)
    site_status = SiteStatus.new(issue)

    site_status.current_status.should == SiteStatus::STATUSES[:green]
  end
end
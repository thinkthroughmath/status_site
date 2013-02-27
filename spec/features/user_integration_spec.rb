require 'spec_helper'

describe "A User" do

  describe "The home page" do

    describe "browsing issues" do
      before do
        @issue = FactoryGirl.create(:issue)
      end

      it "shows issues" do
        visit root_path
        page.click_on @issue.title
        page.should have_content @issue.title
      end

      it "shows updates to issues" do
        update = FactoryGirl.create(:update, issue: @issue)
        visit root_path
        page.click_on @issue.title
        page.should have_content update.title
      end
    end

    it "shows the next message" do
      message = FactoryGirl.create(:message, start_date: Date.tomorrow)
      visit root_path
      page.should have_content message.start_date
    end

    it "shows application status attributes" do
      visit root_path
      page.should have_content 'Apdex'
    end
  end

  it "cannot view the admin dashboard" do
    visit admin_dashboards_path
    page.should_not have_content "Admin Dashboard"
  end
end
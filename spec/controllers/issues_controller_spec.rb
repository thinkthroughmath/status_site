require 'spec_helper'

describe IssuesController do

  describe "GET 'index'" do
    it "gets an index of issues for an ATOM feed" do
      issue = FactoryGirl.create(:issue)
      update = FactoryGirl.create(:update, issue: issue)
      get 'index', format: :atom
      issues = assigns(:issues)
      issues.should include issue
      issues.first.updates.should include update
    end
  end
end
require 'spec_helper'

describe 'An Admin' do

  before do
    @issue = FactoryGirl.create(:issue)
    sign_in_admin
  end

  it 'views updates to an issue' do
    update = FactoryGirl.create(:update, issue: @issue)
    page.click_on 'Issues'
    page.click_on 'View Updates'
    page.should have_content update.title
  end

  it 'creates an update to an issue' do
    page.click_on 'Issues'
    page.click_on 'New Update'
    page.fill_in 'update_title', with: 'Our site is almost done crashing.'
    page.fill_in 'update_body', with: 'It should be back up in 2 minutes.'
    page.click_on 'Save'

    page.should have_content 'Update was successfully created.'
  end

end

describe 'A internet user' do

  it 'cannot create a new update' do
    issue = FactoryGirl.create(:issue)

    visit new_issue_update_path(issue)

    page.should have_content "You need to sign in or sign up before continuing."
  end

end
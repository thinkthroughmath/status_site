require 'spec_helper'

describe 'An Admin' do

  before do
    sign_in_admin
  end

  it 'creates a issue' do
    create_an_issue

    page.should have_content 'Issue was successfully created.'
  end

  it 'emails subscribed users when an issue is created' do
    subscriber = subscribe_a_user
    create_an_issue

    last_message = ActionMailer::Base.deliveries.last
    last_message.bcc.should include subscriber.email
  end

  it 'views current issues' do
    issue = FactoryGirl.create(:issue)

    page.click_on 'Issues'

    page.should have_content issue.title
  end

  it 'edits current issues' do
    edit_an_issue

    page.should have_content 'New Title'
  end

  it 'emails subscribed users when an issue is updated' do
    subscriber = subscribe_a_user
    edit_an_issue

    last_message = ActionMailer::Base.deliveries.last
    last_message.bcc.should include subscriber.email
  end
end

describe 'A internet user' do

  it 'cannot create a new user' do
    visit new_issue_path

    page.should have_content "You need to sign in or sign up before continuing."
  end
end

def create_an_issue
  page.click_on 'Issues'
  page.click_on 'New Issue'
  page.fill_in 'issue_title', with: 'Our site has crashed'
  page.fill_in 'issue_body', with: 'We are working hard to bring it back up'
  page.click_on 'Save'
end

def edit_an_issue
  issue = FactoryGirl.create(:issue, title: 'Old Title')

  page.click_on 'Issues'
  page.click_on issue.title

  page.fill_in 'issue_title', with: 'New Title'
  page.click_on 'Save'
end

def subscribe_a_user
  subscriber = FactoryGirl.create(:email_subscription, confirmed: true)
end
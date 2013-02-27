require 'spec_helper'

describe 'An Admin' do

  before do
    sign_in_admin
  end

  it 'creates a message' do
    page.click_on 'Messages'
    page.click_on 'New Message'
    page.fill_in 'message_body', with: 'Our site has crashed'
    page.fill_in 'message_start_date', with: '01-28-2013'
    page.click_on 'Save'

    page.should have_content 'Message was successfully created.'
  end

  it 'views an index of messages' do
    message = FactoryGirl.create(:message)

    page.click_on 'Messages'

    page.should have_content message.body
  end

  it 'edits current messages' do
    message = FactoryGirl.create(:message, body: 'Old Body')

    page.click_on 'Messages'
    page.click_on message.body

    page.fill_in 'message_body', with: 'New Body'
    page.click_on 'Save'

    page.should have_content 'New Body'
  end

  it 'deletes a message' do
    message = FactoryGirl.create(:message, body: 'To Remove')

    page.click_on 'Messages'
    within("#message-#{message.id}") do
      click_on 'Delete'
    end

    page.should_not have_content 'To Remove'
  end

end

describe 'A internet user' do

  it 'cannot create a new user' do
    visit new_message_path

    page.should have_content "You need to sign in or sign up before continuing."
  end

end
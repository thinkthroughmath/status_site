require 'spec_helper'

describe 'A internet user' do
  it 'subscribes to email updates' do
    visit root_path

    page.fill_in 'email_subscription_email', with: 'tacoman@brazil.edu'
    page.click_on 'Sign Up'

    page.should have_content 'You have been added. Please check your email to confirm your subscription.'
    last_mail = ActionMailer::Base.deliveries.last
    last_mail.to.should include 'tacoman@brazil.edu'
  end

  it 'confirms a valid subscription token' do
    subscription = FactoryGirl.create(:email_subscription, token: 'tacos')

    visit confirm_email_subscription_path(subscription, token: 'tacos')

    page.should have_content 'Subscription confirmed.'
  end

  it "doesn't confirm an a invalid subsription token" do
      subscription = FactoryGirl.create(:email_subscription, token: 'tacos')

    visit confirm_email_subscription_path(subscription, token: 'tamales')

    page.should have_content 'Invalid subscription.'
  end
end

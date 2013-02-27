require 'spec_helper'

describe EmailSubscription do
  describe 'creating a subscription' do
    it "makes a valid new unconfirmed subscription" do
      subscription = EmailSubscription.new_unconfirmed_subscription('test@ttm.com')

      subscription.save.should == true
    end

    it "won't create a new unconfirmed subscription with an email that has a subscription" do
      current_subscription = FactoryGirl.create(:email_subscription)
      subscription = EmailSubscription
        .new_unconfirmed_subscription(current_subscription.email)

      subscription.save.should  == false
    end
  end

  describe 'validating a token' do
    it 'knows when a token in valid' do
      EmailSubscription.any_instance.stub(:token).and_return('tacos')
      subscription = EmailSubscription.new
      subscription.valid_token?('tacos').should == true
    end

    it 'knows when a token is not valid' do
      EmailSubscription.any_instance.stub(:token).and_return('tacos')
      subscription = EmailSubscription.new
      subscription.valid_token?('tamales').should == false
    end
  end

  describe 'confirming a subscription' do
    it 'confirms a subscription for a valid token' do
      EmailSubscription.any_instance.stub(:valid_token?).and_return(true)
      subscription = FactoryGirl.create(:email_subscription)
      subscription.confirm_subscription('tacos')
      subscription.reload.confirmed.should == true
    end

    it "won't confirm a subcription with an invalid token" do
      EmailSubscription.any_instance.stub(:valid_token?).and_return(false)
      subscription = FactoryGirl.create(:email_subscription)
      subscription.confirm_subscription('tamales')
      subscription.reload.confirmed.should == false
    end
  end
end
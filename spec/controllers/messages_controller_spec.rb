require 'spec_helper'

describe MessagesController do


  describe "GET 'next'" do
    before do
      @message = FactoryGirl.create(:message, start_date: Date.current)
    end

    it "gets the next message in JSON" do
      get 'next', format: :json

      response.body.should have_content @message.body
    end

    it "gets the next message in JS" do
      get 'next', format: :js

      assigns(:message).should == @message
    end
  end

  describe "GET 'index'" do
    it "gets an index of messages for an ATOM feed" do
      message = FactoryGirl.create(:message, start_date: Date.current)
      get 'index', format: :atom
      assigns(:messages).should include message
    end
  end
end
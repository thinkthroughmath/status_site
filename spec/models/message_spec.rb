require 'spec_helper'

describe Message do
  describe 'ordering methods' do
    before do
      @old_message    = FactoryGirl.create(:message, start_date: Date.yesterday)
      @next_message   = FactoryGirl.create(:message, start_date: Date.tomorrow)
      @future_message = FactoryGirl.create(:message, start_date: Date.yesterday + 3)
    end

    it 'gets the next message' do
      Message.next_message.should == @next_message
    end

    it 'gets the next messages' do
      Message.next_messages.should == [@next_message, @future_message]
    end
  end

  describe 'upcoming message' do
    it "returns next message when it's start date is within two days" do
      message = mock_model(Message)
      message.should_receive(:within_two_days?).and_return(true)
      Message.should_receive(:next_message).exactly(3).and_return(message)

      Message.upcoming_message.should == message
    end

    it "returns nil when the next message start date is more than two days away" do
      message = mock_model(Message)
      message.should_receive(:within_two_days?).and_return(false)
      Message.should_receive(:next_message).exactly(2).and_return(message)

      Message.upcoming_message.should == nil
    end
  end

  describe 'within_two_days' do
    let(:message){ Message.new }

    it 'returns true when the next message start date is today' do
      Message.any_instance.stub(:start_date).and_return(Date.current)

      message.within_two_days?.should == true
    end

    it 'returns true when the next message start date is tomorrow' do
      Message.any_instance.stub(:start_date).and_return(Date.tomorrow)

      message.within_two_days?.should == true
    end

    it 'returns true when the next message start date is the day after tomorrow' do
      Message.any_instance.stub(:start_date).and_return(Date.current + 2.days)

      message.within_two_days?.should == true
    end

    it 'returns false when the next message start date is 3 days away' do
      Message.any_instance.stub(:start_date).and_return(Date.current + 3.days)

      message.within_two_days?.should == false
    end

  end
end
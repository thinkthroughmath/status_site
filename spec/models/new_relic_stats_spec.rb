require 'spec_helper'

describe NewRelicStats, stub_new_relic: true do
  before do
    @stats = NewRelicStats.new( api_key: '9999', application_name: 'test-application' )
  end

  it 'initializes a New Relic Stats instance for an application' do
    application = @stats.application
    application.name.should == 'test-application'
  end

  it 'gets the threshold values of an application' do
    threshold_value = @stats.application.threshold_values.first
    threshold_value.name.should == 'Apdex'
  end
end
require 'webmock'
include WebMock::API

class NewRelicRequests

  def self.stub!
    stub_request(:get, "http://rpm.newrelic.com/accounts.xml")
      .to_return(accounts_response)

    stub_request(:get, "http://rpm.newrelic.com/accounts/9999/applications.xml")
      .to_return(applications_response)

    stub_request(:get, "http://rpm.newrelic.com/accounts/9999/applications/8888/threshold_values.xml")
      .to_return(theshold_values_response)

    stub_request(:get, "http://rpm.newrelic.com/accounts.xml?include=application_health")
      .to_return(application_health_response)

    stub_request(:get, "http://rpm.newrelic.com/accounts/9999/applications.xml?conditions%5Bname%5D=test-application")
      .to_return(application_by_name_response)
  end

  private

    def self.accounts_response
      File.new("spec/support/webmock/accounts.txt")
    end

    def self.applications_response
      File.new("spec/support/webmock/applications.txt")
    end

    def self.theshold_values_response
      File.new("spec/support/webmock/theshold_values.txt")
    end

    def self.application_health_response
      File.new("spec/support/webmock/application_health.txt")
    end

    def self.application_by_name_response
      File.new("spec/support/webmock/application_by_name.txt")
    end
end
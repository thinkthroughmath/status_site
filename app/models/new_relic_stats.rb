require 'newrelic_api'

class NewRelicStats

  attr_reader :application

  def initialize(args)
    api_key             = args.fetch(:api_key)
    application_name    = args.fetch(:application_name)
    NewRelicApi.api_key = api_key if api_key
    @application        = find_application_by_name(application_name)
  end

  def threshold_values
    @application.threshold_values
  end

  private

    def account
      @account ||= NewRelicApi::Account.find(:first)
    end

    def applications
      account.applications
    end

    def find_application_by_name(application_name)
      params = { params: { conditions: { name: application_name }}}
      applications.find(params).first
    end
end
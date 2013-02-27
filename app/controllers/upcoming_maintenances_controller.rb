class UpcomingMaintenancesController < ApplicationController
  def index
    @messages = Message.next_messages
  end
end
class UpdatesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_issue, only: [:index, :new, :create]

  def index
    @updates = @issue.updates
  end

  def new
    @update = Update.new
  end

  def create
    @update = @issue.updates.new(update_params)
    if @update.save
      unless EmailSubscription.subscribers.empty?
        SubscriptionMailer.issue_updated_notification(@issue).deliver
      end
      redirect_to @issue, notice: 'Update was successfully created.'
    else
      render action: 'new'
    end
  end

  private

    def set_issue
      @issue = Issue.find(params[:issue_id])
    end

    def update_params
      params.require(:update)
        .permit(:title, :body)
    end
end

class IssuesController < ApplicationController
  before_action :authenticate_admin!, except: [:show, :index]
  before_action :set_issue, only: [:update, :edit, :show]
  before_action :set_issues, only: [:index, :admin]

  def index
  end

  def admin
    @issues = Issue.all.map{|i| i.decorate}
  end

  def show
    @updates = @issue.updates.order('created_at DESC')
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      unless EmailSubscription.subscribers.empty?
        SubscriptionMailer.issue_created_notification(@issue).deliver
      end
      redirect_to admin_issues_path, notice: 'Issue was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @issue.update(issue_params)
      unless EmailSubscription.subscribers.empty?
        SubscriptionMailer.issue_updated_notification(@issue).deliver
      end
      redirect_to admin_issues_path, notice: 'Issue was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def issue_params
      params.require(:issue)
        .permit(:title, :body, :current_site_status, :resolved)
    end

    def set_issue
      @issue = Issue.find(params[:id])
    end

    def set_issues
      @issues = Issue.all.map{|i| i.decorate}
    end
end

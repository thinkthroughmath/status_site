class EmailSubscriptionsController < ApplicationController
  before_action :set_email_subscription, only: [:create]

  def create
    if @email_subscription.save && @email_subscription.send_confirmation
      redirect_to :back, notice: "You have been added. Please check your email to confirm your subscription."
    else
      redirect_to :back, alert: "There was an issue with your submission."
    end
  end

  def confirm
    subscription = EmailSubscription.find(params[:id])
    if subscription.confirm_subscription(params[:token])
      redirect_to root_path, notice: "Subscription confirmed."
    else
      redirect_to root_path, alert: "Invalid subscription."
    end
  end

  private

    def email_subscription_params
      params.require(:email_subscription)
        .permit(:email)
    end

    def set_email_subscription
      @email_subscription = EmailSubscription
        .new_unconfirmed_subscription(email_subscription_params[:email])
    end
end

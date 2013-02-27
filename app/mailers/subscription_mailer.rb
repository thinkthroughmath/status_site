class SubscriptionMailer < ActionMailer::Base
  default from: "Think Through Math <no-reply@thinkthroughmath.org>", reply_to: "Think Through Math <support@thinkthroughmath.com>"

  def subscription_confirmation(subscription)
    @subscription = subscription
    mail(:to => subscription.email, :subject => "Confirm your subcription")
  end

  def issue_created_notification(issue)
    @issue = issue
    mail(:bcc => EmailSubscription.subscribers, :subject => "New Think Through Math Issue: #{@issue.title}")
  end

  def issue_updated_notification(issue)
    @issue = issue
    mail(:bcc => EmailSubscription.subscribers, :subject => "Updated Think Through Math Issue: #{@issue.title}")
  end
end
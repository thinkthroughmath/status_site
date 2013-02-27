require 'draper'

class IssueDecorator < Draper::Decorator
  delegate_all

  def admin_updates_link
    if source.updates.empty?
      ""
    else
      h.link_to "View Updates", h.issue_updates_path(source)
    end
  end

end

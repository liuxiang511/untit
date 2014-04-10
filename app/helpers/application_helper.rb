module ApplicationHelper
  def date_selector(args)
    render :partial => "common/date_selector", :locals => {:args => args}
  end
end

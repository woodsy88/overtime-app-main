module ApplicationHelper

#active nav link
  def active?(path)
    #if on current page show "active"
    "active" if current_page?(path)
  end
end

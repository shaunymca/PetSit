module ApplicationHelper
  def sortable(column, title = nil)
  	title ||= column.titleize
    css_class = column == sort_column && sort_direction == "asc" ? "icon-chevron-down" : column == sort_column && sort_direction == "desc" ? "icon-chevron-up" : nil
  	direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to "#{title} <i class=\"#{css_class}\"></i> ".html_safe, params.merge(:sort => column, :direction => direction, :page => nil)
	end
end

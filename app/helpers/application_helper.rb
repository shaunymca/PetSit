module ApplicationHelper
  def sortable(column, title = nil)
  	title ||= column.titleize
    css_class = column == sort_column && sort_direction == "asc" ? "icon-chevron-down" : column == sort_column && sort_direction == "desc" ? "icon-chevron-up" : nil
  	direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to "#{title} <i class=\"#{css_class}\"></i> ".html_safe, params.merge(:sort => column, :direction => direction, :page => nil)
	end
  
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

end

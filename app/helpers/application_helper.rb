module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column
    if column == current_title && sort_direction == 'asc'
      direction = 'desc'
      icon_direction = ''
    else
      direction = 'asc'
      icon_direction = "-alt"
    end

    if column == current_title
      link_to("#{column}<span class='glyphicon glyphicon-sort-by-alphabet#{icon_direction}'></span>".html_safe, :sort => column, :direction => direction)
    else
      link_to(column.capitalize, :sort => column, :direction => direction)
    end
  end

  def sort_name(current_direction)
    if current_direction == 'asc'
      direction = 'desc'
      icon_direction = ''
    else
      direction = 'asc'
      icon_direction = "-alt"
    end
    link_to("Sort<span class='glyphicon glyphicon-sort-by-alphabet#{icon_direction}'></span>".html_safe, root_path(:direction => direction), class: "btn btn-default")
  end

  def clearfixer(i)
    return '<div class="clearfix hidden-xs"></div>'.html_safe if i == 5
    if i.odd?
      '<div class="clearfix hidden-xs hidden-md"></div>'.html_safe
    elsif (i+1)%3 == 0
      '<div class="clearfix hidden-xs hidden-sm"></div>'.html_safe
    end
  end
end

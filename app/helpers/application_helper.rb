module ApplicationHelper
  def sort_order(column, title)
    direction = params[:direction] == 'asc' ? 'desc' : 'asc'
    if params[:commit].present?
      title
    else
      if params[:sort] == column
        if params[:direction] == 'asc'
          link_to "#{title} ▲", { sort: column, direction: direction }, class: 'target'
        else
          link_to "#{title} ▼", { sort: column, direction: direction }, class: 'target'
        end
      else
        link_to title, { sort: column, direction: direction }, class: 'non_target'
      end
    end
  end
end

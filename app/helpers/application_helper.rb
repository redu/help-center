# encoding: utf-8
module ApplicationHelper
  def topic_path_html(topic, without_root = false)
    html = ""
    ancestors = topic.ancestors

    ancestors.shift if without_root

    ancestors.each do |parent|
      html << parent.title
      html << (parent == ancestors.last ? "" : " > ")
    end

    html
  end

  def total_visualizations(view_count)
    if view_count == 0
      "Nenhuma visualização"
    elsif view_count == 1
      "1 visualização"
    else
      "#{ view_count } visualizações"
    end
  end
end

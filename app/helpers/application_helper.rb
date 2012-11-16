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
end

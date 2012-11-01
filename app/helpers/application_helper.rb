module ApplicationHelper
  def topic_path_html(topic)
    html = ""
    ancestors = topic.ancestors

    ancestors.each do |parent|
      html << parent.title
      html << (parent == ancestors.last ? "" : " > ")
    end

    html
  end
end

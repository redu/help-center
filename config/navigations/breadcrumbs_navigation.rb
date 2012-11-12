# -*- coding: utf-8 -*-
root = Topic.create(title: "Nothing", icon_name: "doubt")

@faq ||= root
@basic ||= root
@guide ||= root
@topic ||= root
@ancestors ||= [root]

SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = ''

  navigation.items do |primary|
    primary.item :index, 'Índice', root_path, highlights_on: %r(^(\/indice|\/)$),
      class: "icon-list-lightblue_16_18-before"

    primary.item :roots, 'Índice', show_root_topic_path(@topic) || show_topic_path(@topic.root, @topic) || search_path,
      alt_class: 'breadcrumb-mini-link icon-list-lightblue_16_18-before text-replacement' do |help|
      help.item :faq, @faq.title, show_root_topic_path(@faq),
        class: "breadcrumb-mini-link icon-#{ @faq.icon_name }-lightblue_16_18-before"
      help.item :basic, @basic.title, show_root_topic_path(@basic),
        class: "breadcrumb-mini-link icon-#{ @basic.icon_name }-lightblue_16_18-before"
      help.item :guide, @guide.title, show_root_topic_path(@guide),
        class: "breadcrumb-mini-link icon-#{ @guide.icon_name }-lightblue_16_18-before"
      help.item :topic, @ancestors.first.title, show_root_topic_path(@ancestors.first),
        highlights_on: lambda { highlights?(@topic) },
        class: "breadcrumb-mini-link icon-#{ @ancestors.first.icon_name }-lightblue_16_18-before",
        alt_class: "breadcrumb-mini-link icon-#{ @ancestors.first.icon_name }-lightblue_16_18-before" do |category|
          category.item :category, @topic.title, show_topic_path(@topic.root, @topic),
          unless: Proc.new { @topic.leaf? },
          class: "breadcrumb-mini-link icon-#{ @topic.icon_name }-lightblue_16_18-before"
        end
      help.item :search, "Busca", search_path,
        class: "breadcrumb-mini-link icon-magnifier-lightblue_16_18-before"
    end
  end
end

def highlights?(item)
  id = request.path_parameters[:id]

  if id.nil?
    return false
  end

  topic = Topic.find_using_slug(id)
  topic.leaf?
end
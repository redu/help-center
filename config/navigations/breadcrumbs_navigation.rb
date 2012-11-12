# -*- coding: utf-8 -*-
root = Faq.root

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

    primary.item :roots, 'Índice', faq_path(@faq) || basic_guide_path(@basic) ||
                                   guide_path(@guide) || topic_path(@topic) || search_path,
      alt_class: 'breadcrumb-mini-link icon-list-lightblue_16_18-before text-replacement' do |help|
      help.item :faq, @faq.title, faq_path(@faq),
        class: "breadcrumb-mini-link icon-#{ @faq.icon_name }-lightblue_16_18-before"
      help.item :basic, @basic.title, basic_guide_path(@basic),
        class: "breadcrumb-mini-link icon-#{ @basic.icon_name }-lightblue_16_18-before"
      help.item :guide, @guide.title, guide_path(@guide),
        class: "breadcrumb-mini-link icon-#{ @guide.icon_name }-lightblue_16_18-before"
      help.item :topic, @ancestors.first.title, url_for(@ancestors.first), highlights_on: lambda { highlights?(@topic) },
        class: "breadcrumb-mini-link icon-#{ @ancestors.first.icon_name }-lightblue_16_18-before",
        alt_class: "breadcrumb-mini-link icon-#{ @ancestors.first.icon_name }-lightblue_16_18-before" do |category|
          category.item :category, @topic.title, topic_path(@topic),
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

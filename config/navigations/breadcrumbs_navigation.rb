# -*- coding: utf-8 -*-

@faq ||= Faq.root
@basic ||= BasicGuide.root
@guide ||= Guide.root
@topic ||= Topic.root
@ancestors ||= [Topic.root]

SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = ''

  navigation.items do |primary|
    primary.item :index, 'Índice', root_path,
      class: "icon-list-lightblue_16_18-before"

    primary.item :roots, 'Índice', faq_path(@faq) || basic_guide_path(@basic) || guide_path(@guide) || topic_path(@topic) || search_path,
      alt_class: 'breadcrumb-mini-link icon-list-lightblue_16_18-before text-replacement' do |help|
      help.item :faq, @faq.title, faq_path(@faq),
        class: "breadcrumb-mini-link icon-#{ @faq.icon_name }-lightblue_16_18-before"
      help.item :basic, @basic.title, basic_guide_path(@basic),
        class: "breadcrumb-mini-link icon-#{ @basic.icon_name }-lightblue_16_18-before"
      help.item :guide, @guide.title, guide_path(@guide),
        class: "breadcrumb-mini-link icon-#{ @guide.icon_name }-lightblue_16_18-before"
      help.item :topic, @ancestors.first.title, topic_path(@topic),
        class: "breadcrumb-mini-link icon-#{ @ancestors.first.icon_name }-lightblue_16_18-before"
      help.item :search, "Busca", search_path,
        class: "breadcrumb-mini-link icon-magnifier-lightblue_16_18-before"
    end
  end
end

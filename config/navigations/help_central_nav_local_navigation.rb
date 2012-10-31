# -*- coding: utf-8 -*-
SimpleNavigation::Configuration.run do |navigation|

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  navigation.selected_class = 'nav-local-item-active icon-arrow-right-nav-local-lightblue_11_32-after'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  navigation.active_leaf_class = ''

  # Item keys are normally added to list items as id.
  # This setting turns that off
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'nav-local'

    primary.item :index, 'Índice', root_path,
      :class => 'nav-local-item link-container icon-list-lightblue_16_18-before',
      :link => { :class => 'nav-local-link link-target' }

    primary.item :faq, 'Dúvidas Frequentes', faq_path(Faq.root),
      :class => 'nav-local-item link-container icon-frequent-questions-lightblue_16_18-before',
      :link => { :class => 'nav-local-link link-target' }

    primary.item :guide_basic, 'Guia Básico', basic_guide_path(BasicGuide.root),
      :class => 'nav-local-item link-container icon-basic-guide-lightblue_16_18-before',
      :link => { :class => 'nav-local-link link-target' }

    Guide.roots.each do |guide|
      primary.item :guides, guide.title, guide_path(guide),
        :class => "nav-local-item link-container icon-#{ guide.icon_name }-lightblue_16_18-before",
        :link => { :class => 'nav-local-link link-target' }
    end
  end
end

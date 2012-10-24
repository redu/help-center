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

    primary.item :index, 'Índice', help_central_index_path, :class => 'nav-local-item link-container', :link => { :class => 'nav-local-link link-target' }

    primary.item :faq, 'Dúvidas Frequentes', help_central_faq_path, :class => 'nav-local-item link-container', :link => { :class => 'nav-local-link link-target' }

    primary.item :guide_basic, 'Guia Básico', help_central_guide_basic_path, :class => 'nav-local-item link-container', :link => { :class => 'nav-local-link link-target' }

    primary.item :guide_student, 'Guia do Aluno', help_central_guide_student_path, :class => 'nav-local-item link-container', :link => { :class => 'nav-local-link link-target' }

    primary.item :guide_teacher, 'Guia do Professor', help_central_guide_teacher_path, :class => 'nav-local-item link-container', :link => { :class => 'nav-local-link link-target' }

    primary.item :guide_manager, 'Guia do Gestor', help_central_guide_manager_path, :class => 'nav-local-item link-container', :link => { :class => 'nav-local-link link-target' }

    primary.item :guide_developer, 'Guia do Dev.', help_central_guide_developer_path, :class => 'nav-local-item link-container', :link => { :class => 'nav-local-link link-target' }
  end
end

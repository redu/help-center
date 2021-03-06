class NavLocal < SimpleNavigation::Renderer::Base

  def render(item_container)
    list_content = item_container.items.inject([]) do |list, item|
      li_options = item.html_options.reject {|k, v| k == :link}
      link = link_to(item.name, item.url, link_options_for(item))

      if include_sub_navigation?(item)
        li_content << render_sub_navigation_for(item)
      end

      list << content_tag(:li, link, li_options)
    end.join

    ul_content(list_content, item_container)
  end

  protected

  def ul_content(list, container)
    if skip_if_empty? && item_container.empty?
      ''
    else
      content_tag(:ul, list, {id: container.dom_id, class: container.dom_class})
    end
  end

  # Extracts the options relevant for the generated link
  def link_options_for(item)
    special_options = { method: item.method, class: item.selected_class }.reject { |k, v| v.nil? }
    link_options = item.html_options[:link]
    return special_options unless link_options

    opts = special_options.merge(link_options)
    opts[:class] = [link_options[:class]].flatten.compact.join(' ')
    opts.delete(:class) if opts[:class].nil? || opts[:class] == ''

    opts
  end
end

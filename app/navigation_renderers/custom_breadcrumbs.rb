class CustomBreadcrumbs < SimpleNavigation::Renderer::Base

  def render(item_container, white = false)
    content = a_tags(item_container).join(join_with)
    ul_class = options[:white] ? "breadcrumb-mini white-area" : "breadcrumb-mini"
    content_tag(:ul, content, { :class => ul_class })
  end

  protected

  def a_tags(item_container)
    item_container.items.inject([]) do |list, item|
      if item.selected?
        list << anchor_tag(item)
        if include_sub_navigation?(item)
          list.concat a_tags(item.sub_navigation)
        end
      end
      list
    end
  end

  # Create the anchor element inside of a li for each element on the breadcrumb
  def anchor_tag(item)
    if item.name == '' # Don't use empty elements
      nil
    else
      li_content = content_tag(:a, item.name, { :href => item.url,
                                                :class => switch_class(item) })

      content_tag(:li, li_content,
                  :class => "breadcrumb-mini-item icon-arrow-right-" + \
                    "separator-gray_16_18-after")
    end
  end

  def join_with
    @join_with ||= options[:join_with] || " "
  end

  # Use alt_class when the element on breadcrumb is not activate
  def switch_class(item)
    if !item.active_leaf_class
      item.html_options[:alt_class]
    else
      item.html_options[:class]
    end
  end
end


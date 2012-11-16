module TextHelper
  def markparser
    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                        :autolink => true,
                                        :space_after_headers => false)

    parser
  end

  def truncate_html(html)
    parsed = Nokogiri::HTML(html)
    count = 0
    parsed.xpath("//body").children.each do |child|
      child.remove if count > 2
      count = count + 1
    end

    parsed.to_html
  end

  def truncate_html_tag(html_text, tag)
    parsed = Nokogiri::HTML(html_text)
    parsed.xpath("//"+tag).each do |img|
      img.remove
      img.text.gsub(/\s+/, " ").strip
    end

    parsed.to_html
  end
end


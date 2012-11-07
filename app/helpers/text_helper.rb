module TextHelper
  def markparser
    parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                        :autolink => true,
                                        :space_after_headers => false)

    parser
  end
end

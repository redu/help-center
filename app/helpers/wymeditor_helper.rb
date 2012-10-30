module WymeditorHelper
  def wymeditor_initialize(*dom_ids)
    output = []
    unless(Rails.env =~ /(production)|(test)/)
      output << javascript_include_tag('wymeditor/wymeditor/jquery.wymeditor.js')
    else
      output << javascript_include_tag('wymeditor/wymeditor/jquery.wymeditor.pack.js')
    end
    output << javascript_include_tag('wymrails.js')
    output.join("\n")
  end
end

module ApplicationHelper
  def tags_with_formatting
    formatted_list = []
    WHITELISTED_TAGS.each do |t|
      formatted_list.push([t.titlecase, t])
    end
    return formatted_list
  end
end

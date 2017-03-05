module ApplicationHelper
  def full_title(page_title)
    if (page_title.present?)
      "Blog | #{page_title}"
    else
      'Blog'
    end
  end

  def truncate_text(text, length = 25)
    return text if text.length < length

    "#{text[0..length]}..."
  end
end

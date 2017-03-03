module ApplicationHelper
  def full_title(page_title)
    if (page_title.present?)
      "Blog | #{page_title}"
    else
      'Blog'
    end
  end
end

module StaticPagesHelper
  def full_title title
    base_title = "Ruby on Rails Tutorials Sample App"
    if title == ""
      base_title
    else
      "#{title} | #{base_title}"
    end
  end
end

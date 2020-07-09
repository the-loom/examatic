module NavigationHelper
  def nav_ensure
    @navigation ||= [ ]
  end

  def nav_add(title, url)
    nav_ensure << { title: title, url: url }
  end

  def nav_render
    set_title
    render partial: "shared/navigation", locals: { nav: nav_ensure }
  end

  def page_title(separator = " | ")
    title = content_for(:title) || @title || nil
    [title, "Examatic, by Loom"].flatten.compact.join(separator)
  end

  private
  def set_title
    @title = nav_ensure.reverse.map { |nav| nav[:title] }
  end
end

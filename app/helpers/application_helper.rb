module ApplicationHelper
  def peek(text)
    r = text.to_plain_text
    return "#{r[0..100]} &mldr;" if r.size > 100
    r
  end
end

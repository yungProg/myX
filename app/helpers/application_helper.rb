module ApplicationHelper
  def avatar_url_for(user, opts = {})
    size = opts[:size || 32]
    hash = Digest::MD5.hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{hash}.png?s=#{size}"
  end

  def format_date(date)
    date_string = date.to_s
    Time.new(date_string).strftime("%B %d, %Y")
  end
end

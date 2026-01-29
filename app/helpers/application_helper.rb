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

  def post_duration(post_time)
    diff = Time.now - post_time
    days = (diff/86400).floor
    hours = (diff/3600).floor
    minutes = (diff/60).floor
    return "#{days}d" unless days.zero?
    return "#{hours}h" unless hours.zero?
    return "#{minutes}m" unless minutes.zero?
    "#{diff.floor}s"
  end
end

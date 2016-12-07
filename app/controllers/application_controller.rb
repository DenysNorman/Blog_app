class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :set_visitor_cookie

  def baner
  end

  def welcome
    if current_user
      redirect_to posts_url
    end
  end

  def set_visitor_cookie
    cookies[:visits] = {
        value: increment_counter,
        expires: 1.year.from_now
    }
  end

  def increment_counter
    @pageviews = cookies[:visits].to_i
    if @pageviews.nil? || !user_signed_in?
      @pageviews = 0
    else
      @pageviews += 1
    end
  end

  def track_visits
    @pageviews -= 1
  end

  helper_method :track_visits

  def set_date(post)
    Russian::strftime(post.created_at, " Запись создана: %d %B %Y года в %H:%M")
  end

  helper_method :set_date
end

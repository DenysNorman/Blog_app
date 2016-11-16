class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_visitor_cookie

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
end

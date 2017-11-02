class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
    else
      flash.now[:danger] = "Please login!"
      render "sessions/new"
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end

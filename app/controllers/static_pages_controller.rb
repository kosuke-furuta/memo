class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @taskmemo = current_user.taskmemos.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end

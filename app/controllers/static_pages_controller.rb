class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.taskmemos.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end

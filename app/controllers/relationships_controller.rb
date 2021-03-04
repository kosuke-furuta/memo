class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @taskmemo = Taskmemo.find(params[:followed_id])
    current_user.follow(@taskmemo)
    respond_to do |format|
      format.html { redirect_to @taskmemo }
      format.js
    end
  end

  def destroy
    @taskmemo = Relationship.find(params[:id]).followed
    current_user.unfollow(@taskmemo)
    respond_to do |format|
      format.html { redirect_to @taskmemo }
      format.js
    end
  end
end

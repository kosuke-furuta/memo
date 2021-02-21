class TaskmemosController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @taskmemos = current_user.taskmemos
  end

  def show
    @taskmemo = current_user.taskmemos.find(params[:id])
  end

  def new
    @taskmemo = Taskmemo.new
  end

  def create
    @taskmemo = current_user.taskmemos.build(taskmemo_params)
    @taskmemo.image.attach(params[:taskmemo][:image])
    if @taskmemo.save
      flash[:success] = "「#{@taskmemo.product_name}」を登録しました。"
      # redirect_to @taskmemo
      redirect_to root_url
    else
      @feed_items = current_user.feed.pagenate(page: params[:page])
      # render 'taskmemo/new'
      render 'static_pages/home'
    end
  end

  def edit
    @taskmemo = current_user.taskmemos.find(params[:id])
  end

  def update
    taskmemo = Taskmemo.find(params[:id])
    taskmemo.update!(taskmemo_params)
    flash[:success] = "「#{@taskmemo}」を編集しました。"
    redirect_to taskmemos_url
  end

  def destroy
    @taskmemo.destroy
    flash[:success] = "製品を削除しました。"
    redirect_back(fallback_location: root_url)
  end

  private

  def taskmemo_params
    params.require(:taskmemo).permit(:product_name, :order_number,
                                    :delivery_date, :quantity,
                                    :process, :remarks, :image)
  end

  def correct_user
    @taskmemo = current_user.taskmemos.find_by(id: params[:id])
    redirect_to root_url if @taskmemo.nil?
  end
end

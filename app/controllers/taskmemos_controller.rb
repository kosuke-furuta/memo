class TaskmemosController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

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
    if @taskmemo.save
      flash[:success] = "「#{@taskmemo.product_name}」を登録しました。"
      # redirect_to @taskmemo
      redirect_to root_url
    else
      # render 'taskmemo/new'
      render 'static_pages/home'
    end
  end

  def edit
    @taskmemo = current_user.taskmemos.find(params[:id])
  end

  def update
    taskmemo = Taskmemo.find(params[:id])
    taskmemo.update!(memo_params)
    flash[:success] = "「#{@taskmemo.product_name}」を編集しました。"
    redirect_to taskmemos_url
  end

  def destroy
    taskmemo = current_user.taskmemos.find(params[:id])
    taskmemo.destroy
    flash[:success] = "「#{@taskmemo}」を削除しました。"
    redirect_to taskmemos_url
  end

  private

  def taskmemo_params
    params.require(:taskmemo).permit(:product_name, :order_number,
                                    :delivery_date, :quantity,
                                    :process, :remarks)
  end
end

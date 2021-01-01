class TaskMemosController < ApplicationController
  def index
    @memos = Task.all
  end

  def show
    @memo = Task.find(params[:id])
  end

  def new
    @memo = Task.new
  end

  def create
    @memo = Task.new(memo_params)
    if @memo.save
      flash[:success] = "「#{@memo.product_name}」を登録しました。"
      redirect_to @memo
    else
      render 'task/new'
    end
  end

  def edit
    @memo = Task.find(params[:id])
  end

  def update
    memo = Task.find(params[:id])
    memo.update!(memo_params)
    flash[:success] = "「#{@memo.product_name}」を編集しました。"
    redirect_to tasks_url
  end

  def destroy
    memo = Task.find(params[:id])
    memo.destroy
    flash[:success] = "「#{@memo}」を削除しました。"
    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).permit(:product_name, :order_number,
                                 :delivery_date, :quantity,
                                 :process, :remarks)
  end
end

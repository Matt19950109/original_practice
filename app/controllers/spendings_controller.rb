class SpendingsController < ApplicationController
  def index
    @spendings = Spending.all
  end

  def new
    @spending = Spending.new
  end

  def create
    @spending = Spending.new(spending_params)
    if @spending.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def spending_params
    params.require(:spending).permit(:price, :item_name, :settlement_id, :start_time)
  end

end



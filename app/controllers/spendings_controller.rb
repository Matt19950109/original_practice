class SpendingsController < ApplicationController
  def index
    @spendings = Spending.all
    @total = Spending.group("MONTH(start_time)")
    #@pay = Spending.group("MONTH(start_time)").joins(:settlement).group("settlements.payment").sum(:price)
    #@pay = Spending.group("MONTH(start_time)").joins(:settlement).group("settlements.payment").having('month_start_time = 9').sum(:price)
    @this_month = Spending.where(start_time: [Date.today.all_month]).joins(:settlement).group("settlements.payment").sum(:price)
    @spending = Spending.where(start_time: [Date.today.all_month]).joins(settlement: :income).group("bank_account").sum(:price)
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

  def destroy
    spending = Spending.find(params[:id])
    spending.destroy
    redirect_to spendings_path
  end

  def edit
    @spending = Spending.find(params[:id])
  end

  def update
    spending = Spending.find(params[:id])
    spending.update(spending_params)
    redirect_to spending_path
  end

  def show
    @spending = Spending.find(params[:id])
  end

  private
  def spending_params
    params.require(:spending).permit(:price, :item_name, :settlement_id, :start_time)
  end

end



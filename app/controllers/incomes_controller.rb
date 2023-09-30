class IncomesController < ApplicationController
  def index
    @incomes = Income.all
    @spendings = Spending.all
    @total = Spending.group("MONTH(start_time)")
    #@pay = Spending.group("MONTH(start_time)").joins(:settlement).group("settlements.payment").sum(:price)
    #@pay = Spending.group("MONTH(start_time)").joins(:settlement).group("settlements.payment").having('month_start_time = 9').sum(:price)
    @this_month = Spending.where(start_time: [Date.today.all_month]).joins(:settlement).group("settlements.payment").sum(:price)
    @spending = Spending.where(start_time: [Date.today.all_month]).joins(settlement: :income).group("bank_account").sum(:price)
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save      
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    income = Income.find(params[:id])
    income.destroy
    redirect_to spendings_path
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    income = Income.find(params[:id])
    income.update(income_params)
    redirect_to income_path
  end

  def show
    @income = Income.find(params[:id])
  end

  private
  def income_params
    params.require(:income).permit(:amount_price, :bank_account)
  end

end

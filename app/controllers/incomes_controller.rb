class IncomesController < ApplicationController
  def index
    @incomes = Income.all
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
    income.update(spending_params)
    redirect_to spending_path
  end

  def show
    @income = Income.find(params[:id])
  end

  private
  def income_params
    params.require(:income).permit(:amount_price, :bank_account)
  end

end

class SettlementsController < ApplicationController
  def index
    @settlements = Settlement.all
  end

  def new
    @settlement = Settlement.new
  end

  def create
    @settlement = Settlement.new(settlement_params)
    if @settlement.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def settlement_params
    params.require(:settlement).permit(:payment, :income_id)
  end
end

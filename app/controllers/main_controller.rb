class MainController < ApplicationController

  def root
    redirect_to "/appraisalfees" and return
  end

  def index
    @appraisal_fee = Appraisal_fee.order(:id).all
    render :index and return
  end

  def show
    @appraisal_fee = Appraisal_fee.where(id: params[:id]).first
    render :show and return
  end

end

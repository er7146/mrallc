class MainController < ApplicationController

  def root
    redirect_to "/appraisalfees" and return
  end

  def index
    @appraisalfee = Appraisal_fee.order(:id).all
    render :index and return
  end

  def show
    @appraisalfee = Appraisal_fee.where(id: params[:id]).first
    render :show and return
  end

end

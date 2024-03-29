class UnitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_unit, only: [:edit, :update]
  
  def index
    @q = Unit.ransack(params[:q])
    #@q.sorts = 'my_sort' if @q.sorts.empty?
    @units = @q.result(distinct: true).page(params[:page]).per(50)

  end

  def edit
  end
  
  def update
    @unit.update(unit_params)

  end
  
  def troubleshoot
    @unit = Unit.find(params[:unit_id])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:bandwidth_package_id)
    end
end

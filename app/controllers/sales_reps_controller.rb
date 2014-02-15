class SalesRepsController < ApplicationController
  def new
    @sales_rep = SalesRep.new
    @sales_groups = SalesGroup.all
    @locations = Location.all_available
  end

  def create
    @sales_rep = SalesRep.new sales_rep_params
    if @sales_rep.save
      flash[:notice] = 'Sales Rep successfully created.'
      redirect_to @sales_rep
    else
      render :new
    end
  end

  def show
    @sales_rep = SalesRep.find(params[:id])
  end

  def index
    @sales_reps = SalesRep.all
  end

  def edit
    @sales_rep = SalesRep.find(params[:id])
    @locations = Location.all_available to: @sales_rep
    @sales_groups = SalesGroup.all
  end

  def update
    @sales_rep = SalesRep.find(params[:id])
    if @sales_rep.update_attributes(sales_rep_params)
      flash[:notice] = 'Sales Rep successfully updated.'
      redirect_to @sales_rep
    else
      render :edit
    end
  end

  def destroy
    SalesRep.find(params[:id]).destroy
    flash[:notice] = 'Sales Rep successfully deleted.'
    redirect_to sales_reps_path
  end

  private

  def sales_rep_params
    params.require(:sales_rep).permit(:first_name, :last_name, :sales_group_id, :location_id)
  end

end

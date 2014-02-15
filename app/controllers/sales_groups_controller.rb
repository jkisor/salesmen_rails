class SalesGroupsController < ApplicationController
  def new
    @sales_group = SalesGroup.new
  end

  def create
    @sales_group = SalesGroup.new sales_group_params
    if @sales_group.save
      flash[:notice] = 'Sales Group successfully created.'
      redirect_to @sales_group
    else
      render :new
    end
  end

  def show
    @sales_group = SalesGroup.find(params[:id])
  end

  def index
    @sales_groups = SalesGroup.all
  end

  def edit
    @sales_group = SalesGroup.find(params[:id])
  end

  def update
    @sales_group = SalesGroup.find(params[:id])
    if @sales_group.update_attributes(sales_group_params)
      flash[:notice] = 'Sales Group successfully updated.'
      redirect_to @sales_group
    else
      render :edit
    end
  end

  def destroy
    SalesGroup.find(params[:id]).destroy
    flash[:notice] = 'Sales Group successfully deleted.'
    redirect_to sales_groups_path  
  end

  private

  def sales_group_params
    params.require(:sales_group).permit(:description)
  end
end

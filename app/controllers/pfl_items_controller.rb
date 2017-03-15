class PflItemsController < ApplicationController
  def index
    @portfolio_items = PflItem.all
  end

  def new
    @portfolio_item = PflItem.new
  end

  def create
    @portfolio_item = PflItem.new(params.require(:pfl_item).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to pfl_items_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit 
    @portfolio_item = PflItem.find(params[:id])
  end

  def update
    @portfolio_item = PflItem.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:pfl_item).permit(:title, :subtitle, :body))
        format.html { redirect_to pfl_items_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show 
    @portfolio_item = PflItem.find(params[:id])
  end
end

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
end

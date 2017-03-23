class PflItemsController < ApplicationController
  def index
    @portfolio_items = PflItem.all
  end

  def new
    @portfolio_item = PflItem.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = PflItem.new(portfolio_params)

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
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to pfl_items_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show 
    @portfolio_item = PflItem.find(params[:id])
  end

  def destroy
    @portfolio_item = PflItem.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to pfl_items_url, notice: 'Record was successfully destroyed.' }
    end
  end

  private

  def portfolio_params
    params.require(:pfl_item).permit(:title, 
                                     :subtitle, 
                                     :body, 
                                     technologies_attributes: [:name]
                                     )
  end
end

class PflItemsController < ApplicationController
  def index
    @portfolio_items = PflItem.all
  end
end

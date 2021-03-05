class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item,new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render "new"
    end 
  end


  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

end

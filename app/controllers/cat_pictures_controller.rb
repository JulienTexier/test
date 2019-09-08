class CatPicturesController < ApplicationController
	def create
    @item = Item.find(params[:item_id])
    @item.item_pic.attach(params[:cat_picture])
    redirect_to(item_path(@item))
  end
end

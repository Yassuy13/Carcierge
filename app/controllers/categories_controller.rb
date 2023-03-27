class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  def index
    @categories = Category.all.page(params[:page]).per(10)
    @user = current_user
  end

  def new
    @category = Category.new
    @user = current_user
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      flash[:notice] = "追加しました"
      redirect_to categories_path
    else
      flash.now[:alert] = "追加できませんでした"
      render :new
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end

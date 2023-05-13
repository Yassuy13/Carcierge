class BrowsesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def index
    
  end

  def show
    
  end

  def new
    @post = Post.find(params[:post_id])
    @browse = Browse.new
    @user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @browse = Browse.new(browse_params)
    @browse.user_id = current_user.id
    @browse.post_id = params[:post_id]
    if @browse.save
      flash[:notice] = "回答しました"
      redirect_to("/posts/#{params[:post_id]}")
    else
      @post = Post.find(params[:post_id])
      flash.now[:alert] = "回答できませんでした"
      render "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @browse = @post.browses.find(params[:id])
    @browse.destroy
    flash[:notice] = "削除しました"
    redirect_to("/posts/#{params[:post_id]}")
  end

  private
    def browse_params
      params.require(:browse).permit(:body, :image)
    end
end

class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  def index
    if params[:category_id]
      @posts = Post.where(category_id: params[:category_id]).page(params[:page]).per(10)
    else
      @posts = Post.where('title LIKE ? or body LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(10)
      @posts = Post.joins(:browses).select('posts.*, browses.body').page(params[:page]).per(10)
    end
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @browse = Browse.new
    @user = current_user
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts")
    else
      flash.now[:alert] = "投稿できませんでした"
      render("posts/new")
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "更新しました"
      redirect_to("/posts")
    else
      flash.now[:alert] = "更新できませんでした"
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to("/posts")
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :car_image, :category_id)
    end

    def ensure_correct_user
      @post = Post.find_by(id: params[:id])
      if @post.user_id != current_user.id
        flash[:alert] = "権限がありません"
        redirect_to("/posts")
      end
    end
end

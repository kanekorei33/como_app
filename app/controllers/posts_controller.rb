class PostsController < ApplicationController
  before_action :set_comment, only: [:create, :edit, :update]

  def create
    @post = @comment.posts.build(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
    if @post.save
        format.js { render :index }
      else
        format.html { redirect_to park_comment_path(:park, @comment), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @post = @comment.posts.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @post = @comment.posts.build(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.update(post_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image, :image_cache, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end

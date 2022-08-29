class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
    @q = Comment.ransack(params[:q])
  end

  def search
    @q = Comment.ransack(params[:q]) # 送られてきたパラメータを元にテーブルからデータを検索する
    @comments = @q.result.includes(:category) # 検索結果をActiveRecord_Relationのオブジェクトに変換
    unless @comments.blank?
      @park = @comments.first.park
    else
      @park = Park.find(params[:q][:park_id])
    end
    render "parks/show"
  end

  # GET /comments/1 or /comments/1.json
  def show
    unless logged_in?
      redirect_to new_session_path, notece: "ログインしてください"
    end
    @posts = @comment.posts
    @post = @comment.posts.build
    @park = @comment.park
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @park = Park.find(params[:park_id])
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @park = @comment.park
  end

  # POST /comments or /comments.json
  def create
    if logged_in?
      @comment = current_user.comments.build(comment_params)
      respond_to do |format|
        if @comment.save
          format.html { redirect_to park_path(params[:park_id]), notice: "口コミ投稿しました" }
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  # PATCH/PUT /comments/1 or /comments/1.json
  def update

    respond_to do |format|
      #binding.pry
      if @comment.update(comment_params)
        format.html { redirect_to park_path(params[:park_id]), notice: "口コミ編集しました" }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to park_path(params[:park_id]), notice: "口コミ削除しました" }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content, :image, :image_cache, :category_id).merge(park_id: params[:park_id])
  end
end

class TopsController < ApplicationController

  
  def index
    @playgrounds = Playground.all  #施設と遊具の情報を持ってくる
    @institutions = Institution.all
    
    @tops_search = Park.ransack(params[:q])
    @parks = @tops_search.result
    @parks = @parks.where(park_institutions: Institution.where(institution_id: params[:q][:institution_id])) if params[:q].present? && params[:q][:name].present?
    #@parks = @parks.where(park_playgrounds: Playground.where(playground_id: params[:q][:playground_ids]))

    #Park.where(park_institutions: Institution.where(name:))
    # @q = @park.ransack(params[:q]) # 送られてきたパラメータを元にテーブルからデータを検索する
    # @parks = Park.all
    # @parks = @q.result.includes(:playgrounds, :institutions) # 検索結果をActiveRecord_Relationのオブジェクトに変換
    # @parks = @results # 検索結果を@usersに代入し、index画面に引き継ぐ
    # render :root_url
  end
end
#@articles = @articles.where(article_categories: ArticleCategory.where(category_id: params[:q][:category_ids])) if params[:q].present? && params[:q][:category_ids].present?
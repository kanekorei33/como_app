class TopsController < ApplicationController
  def index
    @playgrounds = Playground.all  #施設と遊具の情報を持ってくる
    @institutions = Institution.all
  end
end

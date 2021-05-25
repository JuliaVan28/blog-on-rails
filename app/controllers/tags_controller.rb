class TagsController < ApplicationController
    def show
      @tag = Tag.find_by(name: params[:id])
      @articles = @tag.posts
    end
  end
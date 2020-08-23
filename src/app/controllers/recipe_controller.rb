class RecipeController < ApplicationController
  def list
    #@recipes = RecipeHelper.recipes
    @recipes = Recipe.all.load

    render :list
  end

  def details
    recipe = Recipe.find(params[:id])
    if recipe.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found
    else
      @tags = recipe.tags
      @chef = recipe.chef
      @photo = recipe.photo
      @title = recipe.title
      @description = RecipeHelper.markdown(recipe.description)

      render :details
    end
  end
end

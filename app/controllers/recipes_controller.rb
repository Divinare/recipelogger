class RecipesController < ApplicationController
  before_filter :ensure_that_signed_in, :except => [:index]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit, :create]
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
    @private_recipes = []
    @public_users_recipes = []
    if not current_user.nil?
      @private_users_recipes = current_user.recipes.where(:private => true)
      @public_users_recipes = current_user.recipes.where(:private => false)
    end
    # All recipes that doesnt belong to @public_users_recipes
    @other_public_recipes = Recipe.public - @public_users_recipes
    order = params[:order] || 'name'

  #  case order
  #    when 'name' then @recipes.sort_by!{ |b| b.name }
  #    when 'time' then @recipes.sort_by!{ |b| b.production_time }
  #  end


  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    if have_rights?
      @ingredients = Recipe.find(params[:id]).ingredients
    else
      redirect_to recipes_url, :notice => "Insufficient rights!"
    end
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @selectedIngredients = []
  end

  # GET /recipes/1/edit
  def edit
    if have_rights?
      @ingredients = Ingredient.all
      @selectedIngredients = Recipe.find(params[:id]).ingredients
    else
      redirect_to recipes_url, :notice => "Insufficient rights!"
    end
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        current_user.recipes << @recipe
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    if have_rights?
       @recipe.destroy
       respond_to do |format|
         format.html { redirect_to recipes_url }
         format.json { head :no_content }
       end
    else
      redirect_to recipes_url, :notice => "Insufficient rights!"
   end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:production_time, :category_id, :name, :instruction, :private)
    end

    def set_categories
      @categories = Category.all
    end

    def have_rights?
       if not Recipe.find(params[:id]).private?
         return true
       elsif current_user.recipes.include? Recipe.find(params[:id])
         return true
       end
       return false
    end
end

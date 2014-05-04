class RatingsController < ApplicationController
  before_filter :ensure_that_signed_in, :except => [:index]
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :set_recipes, only: [:new, :edit, :create]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    if have_rights?
    else
      redirect_to ratings_url, :notice => "Insufficient rights!"
    end
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
    if have_rights?
    else
      redirect_to ratings_url, :notice => "Insufficient rights!"
    end
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)
    if rating_has_been_rated(rating_params[:recipe_id])
      @rating.errors[:base] << "You can't rate the same recipe more than once"
      render :new
    elsif @rating.save
      current_user.ratings << @rating
      redirect_to ratings_path, notice: 'Rating was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to ratings_path, notice: 'Rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    if have_rights?
      @rating.destroy
      respond_to do |format|
        format.html { redirect_to ratings_url }
        format.json { head :no_content }
      end
    else
       redirect_to ratings_url, :notice => "Insufficient rights!"
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rating
    @rating = Rating.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rating_params
    params.require(:rating).permit(:recipe_id, :score)
  end

  def set_recipes
    @recipes = Recipe.all
  end

  def rating_has_been_rated(recipe_id)
    if Rating.where(:user_id => current_user.id, :recipe_id => recipe_id).first.nil?
      return false
    else
      return true
    end
  end

  def have_rights?
    if is_right_user(Rating.find(params[:id]).user_id)
      return true
    end
    return false
  end

end

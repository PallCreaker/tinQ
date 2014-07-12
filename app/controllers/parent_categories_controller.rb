class ParentCategoriesController < ApplicationController
  before_action :set_parent_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @parent_categories = ParentCategory.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @parent_category = ParentCategory.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @parent_category = ParentCategory.new(parent_category_params)

    respond_to do |format|
      if @parent_category.save
        format.html { redirect_to @parent_category, notice: 'Parent Category was successfully created.' }
        format.json { render :show, status: :created, location: @parent_category }
      else
        format.html { render :new }
        format.json { render json: @parent_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @parent_category.update(parent_category_params)
        format.html { redirect_to @parent_category, notice: 'Parent Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent_category }
      else
        format.html { render :edit }
        format.json { render json: @parent_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @parent_category.destroy
    respond_to do |format|
      format.html { redirect_to parent_categories_url, notice: 'Parent Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent_category
      @parent_category = ParentCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_category_params
      params.require(:parent_category).permit(:name)
    end
end

class ChildCategoriesController < ApplicationController
  before_action :set_child_category, only: [:show, :edit, :update, :destroy]

  # GET /child_categories
  # GET /child_categories.json
  def index
    @child_categories = ChildCategory.all
  end

  # GET /child_categories/1
  # GET /child_categories/1.json
  def show
  end

  # GET /child_categories/new
  def new
    @child_category = ChildCategory.new
  end

  # GET /child_categories/1/edit
  def edit
  end

  # POST /child_categories
  # POST /child_categories.json
  def create
    @child_category = ChildCategory.new(child_category_params)

    respond_to do |format|
      if @child_category.save
        format.html { redirect_to @child_category, notice: 'Child category was successfully created.' }
        format.json { render :show, status: :created, location: @child_category }
      else
        format.html { render :new }
        format.json { render json: @child_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /child_categories/1
  # PATCH/PUT /child_categories/1.json
  def update
    respond_to do |format|
      if @child_category.update(child_category_params)
        format.html { redirect_to @child_category, notice: 'Child category was successfully updated.' }
        format.json { render :show, status: :ok, location: @child_category }
      else
        format.html { render :edit }
        format.json { render json: @child_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /child_categories/1
  # DELETE /child_categories/1.json
  def destroy
    @child_category.destroy
    respond_to do |format|
      format.html { redirect_to child_categories_url, notice: 'Child category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child_category
      @child_category = ChildCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def child_category_params
      params.require(:child_category).permit(:parent_category_id)
    end
end

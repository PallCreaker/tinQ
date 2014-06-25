class QynqynsController < ApplicationController
  before_action :set_qynqyn, only: [:show, :edit, :update, :destroy]

  # GET /qynqyns
  # GET /qynqyns.json
  def index
    @qynqyns = Qynqyn.all
  end

  # GET /qynqyns/1
  # GET /qynqyns/1.json
  def show
  end

  # GET /qynqyns/new
  def new
    @qynqyn = Qynqyn.new
  end

  # GET /qynqyns/1/edit
  def edit
  end

  # POST /qynqyns
  # POST /qynqyns.json
  def create
    @qynqyn = Qynqyn.new(qynqyn_params)

    respond_to do |format|
      if @qynqyn.save
        format.html { redirect_to @qynqyn, notice: 'Qynqyn was successfully created.' }
        format.json { render :show, status: :created, location: @qynqyn }
      else
        format.html { render :new }
        format.json { render json: @qynqyn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qynqyns/1
  # PATCH/PUT /qynqyns/1.json
  def update
    respond_to do |format|
      if @qynqyn.update(qynqyn_params)
        format.html { redirect_to @qynqyn, notice: 'Qynqyn was successfully updated.' }
        format.json { render :show, status: :ok, location: @qynqyn }
      else
        format.html { render :edit }
        format.json { render json: @qynqyn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qynqyns/1
  # DELETE /qynqyns/1.json
  def destroy
    @qynqyn.destroy
    respond_to do |format|
      format.html { redirect_to qynqyns_url, notice: 'Qynqyn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qynqyn
      @qynqyn = Qynqyn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qynqyn_params
      params.require(:qynqyn).permit(:count)
    end
end

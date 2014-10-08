class TeachingMaterialsController < ApplicationController
  before_action :set_teaching_material, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, except: [:index]
  
  # GET /teaching_materials
  # GET /teaching_materials.json
  def index
    @teaching_materials = TeachingMaterial.all
  end

  # GET /teaching_materials/1
  # GET /teaching_materials/1.json
  def show
  end

  # GET /teaching_materials/new
  def new
    @teaching_material = TeachingMaterial.new
  end

  # GET /teaching_materials/1/edit
  def edit
  end

  # POST /teaching_materials
  # POST /teaching_materials.json
  def create
    @teaching_material = TeachingMaterial.new(teaching_material_params)

    respond_to do |format|
      if @teaching_material.save
        format.html { redirect_to @teaching_material, notice: 'Teaching material was successfully created.' }
        format.json { render :show, status: :created, location: @teaching_material }
      else
        format.html { render :new }
        format.json { render json: @teaching_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teaching_materials/1
  # PATCH/PUT /teaching_materials/1.json
  def update
    respond_to do |format|
      if @teaching_material.update(teaching_material_params)
        format.html { redirect_to @teaching_material, notice: 'Teaching material was successfully updated.' }
        format.json { render :show, status: :ok, location: @teaching_material }
      else
        format.html { render :edit }
        format.json { render json: @teaching_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teaching_materials/1
  # DELETE /teaching_materials/1.json
  def destroy
    @teaching_material.destroy
    respond_to do |format|
      format.html { redirect_to teaching_materials_url, notice: 'Teaching material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teaching_material
      @teaching_material = TeachingMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teaching_material_params
      params.require(:teaching_material).permit(:name, :description, :link, :image)
    end
end

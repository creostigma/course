class MedicineCategoriesController < ApplicationController
  before_action :set_medicine_category, only: [:show, :edit, :update, :destroy]

  # GET /medicine_categories
  # GET /medicine_categories.json
  def index
    @medicine_categories = MedicineCategory.all
  end

  # GET /medicine_categories/1
  # GET /medicine_categories/1.json
  def show
  end

  # GET /medicine_categories/new
  def new
    @medicine_category = MedicineCategory.new
  end

  # GET /medicine_categories/1/edit
  def edit
  end

  # POST /medicine_categories
  # POST /medicine_categories.json
  def create
    @medicine_category = MedicineCategory.new(medicine_category_params)

    respond_to do |format|
      if @medicine_category.save
        format.html { redirect_to @medicine_category, notice: 'Medicine category was successfully created.' }
        format.json { render :show, status: :created, location: @medicine_category }
      else
        format.html { render :new }
        format.json { render json: @medicine_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicine_categories/1
  # PATCH/PUT /medicine_categories/1.json
  def update
    respond_to do |format|
      if @medicine_category.update(medicine_category_params)
        format.html { redirect_to @medicine_category, notice: 'Medicine category was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicine_category }
      else
        format.html { render :edit }
        format.json { render json: @medicine_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicine_categories/1
  # DELETE /medicine_categories/1.json
  def destroy
    @medicine_category.destroy
    respond_to do |format|
      format.html { redirect_to medicine_categories_url, notice: 'Medicine category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine_category
      @medicine_category = MedicineCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicine_category_params
      params.require(:medicine_category).permit(:medicine_id, :category_id)
    end
end

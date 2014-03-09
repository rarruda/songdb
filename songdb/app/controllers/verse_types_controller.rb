class VerseTypesController < ApplicationController
  before_action :set_verse_type, only: [:show, :edit, :update, :destroy]

  # GET /verse_types
  # GET /verse_types.json
  def index
    @verse_types = VerseType.all
  end

  # GET /verse_types/1
  # GET /verse_types/1.json
  def show
  end

  # GET /verse_types/new
  def new
    @verse_type = VerseType.new
  end

  # GET /verse_types/1/edit
  def edit
  end

  # POST /verse_types
  # POST /verse_types.json
  def create
    @verse_type = VerseType.new(verse_type_params)

    respond_to do |format|
      if @verse_type.save
        format.html { redirect_to @verse_type, notice: 'Verse type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @verse_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @verse_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verse_types/1
  # PATCH/PUT /verse_types/1.json
  def update
    respond_to do |format|
      if @verse_type.update(verse_type_params)
        format.html { redirect_to @verse_type, notice: 'Verse type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @verse_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verse_types/1
  # DELETE /verse_types/1.json
  def destroy
    @verse_type.destroy
    respond_to do |format|
      format.html { redirect_to verse_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verse_type
      @verse_type = VerseType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def verse_type_params
      params.require(:verse_type).permit(:name, :order, :shortcut_key)
    end
end

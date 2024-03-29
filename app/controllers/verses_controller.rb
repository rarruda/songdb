class VersesController < ApplicationController
  before_action :set_verse, only: [:show, :edit, :update, :destroy]

  # GET /verses
  # GET /verses.json
  def index
    @verses = Verse.all
  end

  # GET /verses/1
  # GET /verses/1.json
  def show
  end

  # GET /verses/new
  def new
    @verse = Verse.new
  end

  # GET /verses/1/edit
  def edit
  end

  # POST /verses
  # POST /verses.json
  def create
    @verse = Verse.new(verse_params)

    respond_to do |format|
      if @verse.save
        format.html { redirect_to @verse, notice: 'Verse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @verse }
      else
        format.html { render action: 'new' }
        format.json { render json: @verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verses/1
  # PATCH/PUT /verses/1.json
  def update
    respond_to do |format|
      if @verse.update(verse_params)
        format.html { redirect_to @verse, notice: 'Verse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @verse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verses/1
  # DELETE /verses/1.json
  def destroy
    @verse.destroy
    respond_to do |format|
      format.html { redirect_to verses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verse
      @verse = Verse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def verse_params
      params.require(:verse).permit(:song_id, :position, :verse_type_id, :note, :content)
    end
end

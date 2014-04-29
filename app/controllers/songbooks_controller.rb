class SongbooksController < ApplicationController
  before_action :set_songbook, only: [:show, :edit, :update, :destroy]

  # GET /songbooks
  # GET /songbooks.json
  def index
    @songbooks = Songbook.all
  end

  # GET /songbooks/1
  # GET /songbooks/1.json
  def show
  end

  # GET /songbooks/new
  def new
    @songbook = Songbook.new
  end

  # GET /songbooks/1/edit
  def edit
  end

  # POST /songbooks
  # POST /songbooks.json
  def create
    @songbook = Songbook.new(songbook_params)

    respond_to do |format|
      if @songbook.save
        format.html { redirect_to @songbook, notice: 'Songbook was successfully created.' }
        format.json { render action: 'show', status: :created, location: @songbook }
      else
        format.html { render action: 'new' }
        format.json { render json: @songbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songbooks/1
  # PATCH/PUT /songbooks/1.json
  def update
    respond_to do |format|
      if @songbook.update(songbook_params)
        format.html { redirect_to @songbook, notice: 'Songbook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @songbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songbooks/1
  # DELETE /songbooks/1.json
  def destroy
    @songbook.destroy
    respond_to do |format|
      format.html { redirect_to songbooks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_songbook
      @songbook = Songbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def songbook_params
      params.require(:songbook).permit(:name)
    end
end

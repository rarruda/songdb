class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :xml, :pro4, :pro5

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  def search

    if params[:page].nil? or params[:page].empty?
      page = 1
    else
      page = params[:page]
    end

    if params[:q].nil?
      #@songs = Song.all
      @songs = Song.order(:id).page(page).per(5)
    else
      @songs = Song.where( 'title LIKE ? OR subtitle LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%" ).page(page).per(5)
    end
  end

  # GET /songs/1/slide
  def slide
    @song = Song.find(params[:id])
    respond_to do |format|
      format.html
      format.xml
      format.pro4 { render :action => "slide.pro4.xml.builder" }
      format.pro5 { render :action => "slide.pro5.xml.builder" }
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
    @song.verses.build
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
    if @song.verses.empty?
      @song.verses.build
    end
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song }
      else
        format.html { render action: 'new' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :subtitle, :author, :composer, :translator, :copyright, :note, :language_id,
        verses_attributes: [ :id, :position, :verse_type_id, :content, :_destroy ] )
    end
end

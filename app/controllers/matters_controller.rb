class MattersController < ApplicationController
  before_action :set_matter, only: [:show, :edit, :update, :destroy]
  
  

  # GET /matters
  # GET /matters.json
  def index
    @matters = Matter.all
    if params[:search]
      @matters = Matter.search(params[:search]).order("created_at DESC")
    else
      @matters = Matter.all.order("created_at DESC")
    end
  end

  def find
    @terms = nil
    @matters = Matter.all
    puts "Controller 0"
    puts "#{params}"
    if params[:commit]
      @special_hash = {"acquired_date_T" => ":acquired_date" , "loaned_date_T" => ":loaned_date", "released_date_T" => ":released_date"}
      @not_special_array = ["utf8", "commit", "controller", "action"]
      params.each do |k,v|
        puts "Out Here #{k}, #{v} #{@terms}"
        next if @not_special_array.include? k.to_s
        puts "Here Maybe #{k}, #{v} #{@terms}"
        next if v.blank? unless @special_hash.include? k.to_s
        clean = v.gsub(/[^A-Za-z0-9 ]/, '')
        puts "Right Cheer #{k}, #{v}, #{clean},  #{@terms}"
        if clean.blank?
          clean = @special_hash.fetch(k.to_s)
          puts "In Here #{k}, #{v}, #{clean}, #{@terms}"
          @terms = "#{@terms} AND #{clean} != NULL" unless @terms.blank? 
            @terms ||= "#{clean} != NULL"
        else
          @terms = "#{@terms} AND #{k} LIKE '%#{clean.strip}%'" unless @terms.blank? 
            @terms ||= "#{k} LIKE '%#{clean.strip}%'"
            puts "In There #{k}, #{v}, #{clean}, #{@terms}"
        end          
      end
      puts "Controller" 
      puts "Terms #{@terms}"
      
      #@matters = Matter.find_it_by(@terms).order("created_at DESC")
      @matters = Matter.find_it_by(@terms)
      #@matters.blank?
      render :index, collection: @matters #unless @matters.blank?
    else
      render :find
    end
  end

  # GET /matters/1
  # GET /matters/1.json
  def show
  end

  # GET /matters/new
  def new
    @matter = Matter.new
  end

  # GET /matters/1/edit
  def edit
  end

  # POST /matters
  # POST /matters.json
  def create
    @matter = Matter.new(matter_params)

    respond_to do |format|
      if @matter.save
        format.html { redirect_to @matter, notice: 'Matter was successfully created.' }
        format.json { render :show, status: :created, location: @matter }
      else
        format.html { render :new }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matters/1
  # PATCH/PUT /matters/1.json
  def update
    respond_to do |format|
      if @matter.update(matter_params)
        format.html { redirect_to @matter, notice: 'Matter was successfully updated.' }
        format.json { render :show, status: :ok, location: @matter }
      else
        format.html { render :edit }
        format.json { render json: @matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matters/1
  # DELETE /matters/1.json
  def destroy
    @matter.destroy
    respond_to do |format|
      format.html { redirect_to matters_url, notice: 'Matter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matter
      @matter = Matter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matter_params
      params.require(:matter).permit(:name_or_type, :location, :acquired_date, :value, :loaned_to, :loaned_date, :description, :notes, :upc_barcode, :title, :released_date, :format, :artist_or_band, :track_list, :amateur, :lineage)
    end
end

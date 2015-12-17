class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy, :mail]

  # 全ページ、ログイン必須
  before_filter  :authenticate_user!, except: []


  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params.strip_tags)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # POST /cars/searchword
  def searchword
    @cars = search_cars_by_word params[:search_word]
  end

  # POST /cars/searchid
  def searchid
    @cars = search_cars_by_id params[:search_id]
  end


  # POST /cars/fileupload
  def fileupload
    save_file params[:files] if params[:files]
    
    @cars = Car.all
    render :action => 'index'
  end


  # /cars/1/mail
  def mail
    to = params[:mail_to] || 'ta_kondoh@actis.co.jp'
    PostMailer.post_carinfo(to, @car).deliver_now

    @cars = Car.all
    render :action => 'edit'
  end


  private
    #
    def save_file files
      files.each do |file|
        ImageFile.new(file).name('hoge').resize().store()
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:name, :owner_id)
    end

    # search cars by word (e.g 'toyo niss'), cond('and' or 'or')
    def search_cars_by_word (word, cond = 'or')
      words = word.split.map{|v| "%#{v}%"}                     # 'toyo niss' --> ['%toyo%', '%niss%']
      query = (['name like ?'] * words.size).join(" #{cond} ") # 'name like ? or name like ? or ...'

      Car.where([query, *words]).map.to_a
    end

    # search cars by id (e.g '1,2'), cond('and' or 'or')
    def search_cars_by_id (id, cond = 'or')
      ids = id.split(',').map(&:strip)                       # '1, 2' --> ['1', '2']
      query = (['id = ?'] * ids.size).join(" #{cond} ")      # 'id = ? or id = ? or ...'

      Car.where([query, *ids]).map.to_a
    end
end


class SuperHerosController < ApplicationController
  before_action :set_super_hero, only: [:show, :edit, :update, :destroy]
  before_action :set_order_by, only: [:search, :index]

  def search
    # order_by = params[:order_by]  || "hero_name DESC, secret_identity ASC, powers DESC, team ASC"
    @super_heros = SuperHero.for_user(current_user).where("hero_name like ?", "%#{params[:search_query]}%").order(@order_by).page params[:page]
    render template: "super_heros/index"
  end

  # GET /super_heros
  # GET /super_heros.json
  def index
    # order_by = params[:order_by]  || "hero_name DESC, secret_identity ASC, powers DESC, team ASC"
    @super_heros = SuperHero.for_user(current_user).order(@order_by).page params[:page]

    #@super_heros = SuperHero.where(user: current_user).order(order_by).page params[:page]
    #@super_heros = SuperHero.where(user: current_user)
  end

  # GET /super_heros/1
  # GET /super_heros/1.json
  def show
  end

  # GET /super_heros/new
  def new
    @super_hero = SuperHero.new
  end

  # GET /super_heros/1/edit
  def edit
  end

  # POST /super_heros
  # POST /super_heros.json
  def create
    @super_hero = SuperHero.new(super_hero_params)
    @super_hero.user = current_user
    respond_to do |format|
      if @super_hero.save
        format.html { redirect_to @super_hero, notice: 'Super hero was successfully created.' }
        format.json { render :show, status: :created, location: @super_hero }
      else
        format.html { render :new }
        format.json { render json: @super_hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /super_heros/1
  # PATCH/PUT /super_heros/1.json
  def update
    respond_to do |format|
      if @super_hero.update(super_hero_params)
        format.html { redirect_to @super_hero, notice: 'Super hero was successfully updated.' }
        format.json { render :show, status: :ok, location: @super_hero }
      else
        format.html { render :edit }
        format.json { render json: @super_hero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_heros/1
  # DELETE /super_heros/1.json
  def destroy
    @super_hero.destroy
    respond_to do |format|
      format.html { redirect_to super_heros_url, notice: 'Super hero was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_super_hero
      @super_hero = SuperHero.for_user(current_user).find(params[:id])
    end

    def set_order_by
      @order_by = params[:order_by]  || "hero_name DESC, secret_identity ASC, powers DESC, team ASC"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def super_hero_params
      params.require(:super_hero).permit(:hero_name, :secret_identity, :powers, :team, :pic, :user_id)
    end
end

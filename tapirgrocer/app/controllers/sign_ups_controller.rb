class SignUpsController < ApplicationController
  before_action :set_sign_up, only: [:show, :edit, :update, :destroy]

  # GET /sign_ups
  # GET /sign_ups.json
  def index
    @sign_ups = SignUp.all
  end

  # GET /sign_ups/1
  # GET /sign_ups/1.json
  def show
  end

  # GET /sign_ups/new
  def new
    @sign_up = SignUp.new
  end

  def panel
    @panel= SignUp.panel
  end
  # GET /sign_ups/1/edit
  def edit
  end

  # POST /sign_ups
  # POST /sign_ups.json
  def create
    @sign_up = SignUp.new(sign_up_params)

    respond_to do |format|
      if @sign_up.save
        # format.html { redirect_to @sign_up, notice: 'Sign up was successfully created.' }
        format.html { redirect_to panel_path(1)}
      else
        format.html { render :new }
        format.json { render json: @sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sign_ups/1
  # PATCH/PUT /sign_ups/1.json
  def update
    respond_to do |format|
      if @sign_up.update(sign_up_params)
        format.html { redirect_to @sign_up, notice: 'Sign up was successfully updated.' }
        format.json { render :show, status: :ok, location: @sign_up }
      else
        format.html { render :edit }
        format.json { render json: @sign_up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_ups/1
  # DELETE /sign_ups/1.json
  def destroy
    @sign_up.destroy
    respond_to do |format|
      format.html { redirect_to sign_ups_url, notice: 'Sign up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign_up
      @sign_up = SignUp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sign_up_params
      params.require(:sign_up).permit(:fullname, :store_location)
    end
end

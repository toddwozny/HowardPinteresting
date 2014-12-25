class HpinsController < ApplicationController
  before_action :set_hpin, only: [:show, :edit, :update, :destroy]
  
  def index
    @hpins = Hpin.all
  end

  def show
  end
 
  def new
    @hpin = Hpin.new
  end
 
  def edit
  end

  def create
    @hpin = Hpin.new(hpin_params)

      if @hpin.save
        redirect_to @hpin, notice: 'Pin was successfully created.' 
      else
        render action: 'new' 
      end
  end
  

  def update
     if @hpin.update(hpin_params)
        redirect_to @hpin, notice: 'Pin was successfully updated.' 
     else
        render action: 'edit' 
     end
  end 

  def destroy
    @hpin.destroy
    redirect_to hpins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hpin
      @hpin = Hpin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hpin_params
      params.require(:hpin).permit(:description)
    end
end

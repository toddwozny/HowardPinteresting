class HpinsController < ApplicationController
  before_action :set_hpin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @hpins = Hpin.all
  end

  def show
  end
 
  def new
    @hpin = current_user.hpins.build  
  end
 
  def edit
  end

  def create
    @hpin = current_user.hpins.build(hpin_params)
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

    def correct_user
      @hpin = current_user.hpins.find_by(id: params[:id])
      redirect_to hpins_path, notice: "Not authorized to edit this pin" if @hpin.nil?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def hpin_params
      params.require(:hpin).permit(:description)
    end
end

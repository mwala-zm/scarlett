class CropsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_crop, only: %i[show edit update destroy]

  def index
    # @crops = Crop.accessible_by(current_ability)
    @crops = Crop.all
  end

  def show; end

  def edit; end

  def create
    @crop = Crop.new(crop_params.merge(user: current_user))
    @crop.save
  end

  def update
    respond_to do |format|
      if @crop.update(post_params)
        format.html { redirect_to post_url(@crop), notice: 'Successfully updated.' }
        format.json { render :show, status: :ok, location: @crop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @crop.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: '#{@crop.name} has been removed successfully.' }
      format.json { head :no_content }
    end
  end

  private

  def set_crop
    @crop = Crop.find(params[:id])
  end

  def crop_params
    params.require(:crop).permit(:name, :description, :growth_stage, :crop_family)
  end
end

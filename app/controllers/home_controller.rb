class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @storages = current_user.storages
  end

  def new
    @storage  = current_user.storages.new
  end

  def create
    @storage = current_user.storage.new(storage_params)
      if @storage.save
        flash[:notice] = 'You have created a new storage'
        redirect_to storage_path
      else
        flash[:error] = 'There were some problems with saving your storage'
        render :new
      end
  end

  def show

  end

  def destroy
    @storage.destroy
    flash[:notice] = "Storage @storage.storage_name has been deleted."
    redirect_to storage_path
  end

  private

  def storage_params
    params.require(:storage).permit(:storage_name)
  end

  def set_storage
    @storage = current_user.storage.find(params[:id])
  end
end

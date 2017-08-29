class StoragesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_storage, only: [:edit, :update, :destroy]

  def index
    @storages = current_user.storages
    @fridge = current_user.storage.where(storage_name: 'Fridge')
    @refrigerator = current_user.storage.where(storage_name: 'Refrigerator')
    @pantry = current_user.storage.where(storage_name: 'Pantry')
  end

  def new
    @storage  = current_user.storages.new
  end

  def create
    @storage = current_user.storages.new(storage_params)
      if @storage.save
        flash[:notice] = 'You have created a new storage'
        redirect_to root_path
      else
        flash[:error] = 'There were some problems with saving your storage'
        render :new
      end
  end

  def edit
  end

  def show
  end

  def destroy
    @storage.destroy
    flash[:notice] = "Storage #{@storage.storage_name} has been deleted."
    redirect_to root_path
  end

  def update
    if @storage.update(storage_params)
      redirect_to root_path, notice: 'Storage was successfully updated.'
    else
      render :edit
    end
  end

  protected
  def set_storage
    @storage = current_user.storages.find(params[:id])
  end

  private

  def storage_params
    params.require(:storage).permit(:storage_name)
  end
end

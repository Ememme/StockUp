class ProductTypesController < ApplicationController
  before_action :set_product_type, only: [:edit, :update, :destroy]

  def index
    # czy product_type?
    @product_types = ProductType.all
  end

  def show

  end

  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new(product_type_params)
      if @product_type.save
        flash[:notice] = 'Product type created.'
       # session[:return_to] = request.referer
        # redirect_to product_types_path
       # czy redirect_to :back?????

      #  jeśli taki typ z jednostka istnieje nie twozr nowej!
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @product_type.update(product_type_params)
      flash[:notice] = 'Product type updated.'
      redirect_to product_types_path
    else
      render :edit
    end
  end


  def destroy
    if @product.product_type.empty?
      @product_type.destroy
      flash[:notice] = "Product type has been deleted."
    else
      flash[:notice] = "Product type assigned to product cannot be deleted"
    end
    redirect_to product_types_path
  end


  private
    def product_type_params
      params.require(:product_type).permit(:product_type, :unit)
    end

    def set_product_type
      @product_type = ProductType.find(params[:id])
      # @product_type = ProductsType.find(params[:product_type_id])
    end
end

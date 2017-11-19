class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "products",
        layout: 'pdf'
      end
    end
  end

  def buscar
    
  end

  def resultado
    @products = Product.search(params[:query])
    #respond_with @products
    respond_to do |format|
      format.html { render :resultado }
    end
    
  end

  # GET /products/1
  # GET /products/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "products",
        layout: 'pdf'
      end
    end
  end

  # GET /products/new
  def new
    @product = Product.new
    @category_select = Category.all
    @categ = Category.new

  end

  # GET /products/1/edit
  def edit
    @category_select = Category.all
  end

  # POST /products
  # POST /products.json
  def create
    @categ = Category.new
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Produto foi criado com sucesso!' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
        @product = Product.find(params[:id]) 
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js # views/products/create.js.erb
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
      format.js # views/products/destroy.js.erb
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:code, :name, :category_id, :description, :provider, category_attributes: [:id, :name])
    end
end

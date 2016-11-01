module Api
  module V2
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :edit, :update, :destroy]

      respond_to :json

      def index
        respond_with Product.limit(10)
      end

      def show
        respond_with @product
      end

      def create
        @product = Product.new(product_params)
      end

      def update
        respond_to do |format|
          if @product.update(product_params)
            format.html { redirect_to @product, notice: 'Product was successfully updated.' }
            format.json { render :show, status: :ok, location: @product }
          else
            format.html { render :edit }
            format.json { render json: @product.errors, status: :unprocessable_entity }
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
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_product
          @product = Product.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def product_params
          params.require(:product).permit(:title, :price, :released_on, :active)
        end
    end    
  end
end


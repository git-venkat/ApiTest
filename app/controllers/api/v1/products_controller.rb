module Api
  module V1
    class ProductsController < ApplicationController
      skip_before_filter :verify_authenticity_token, :only => :create
      before_action :set_product, only: [:show, :edit, :update, :destroy]

      respond_to :json

      class Product < ::Product
        # released_on = released_at.to_date

        def as_json(options = {})
          date = released_at.to_date rescue Date.today
          super.merge(released_on: date)
        end
      end

      def index
        respond_with Product.limit(10)
      end

      def show
        respond_with @product
      end

      def create
        @product = Product.new(product_params)

        respond_to do |format|
          if @product.save
            format.json { render json: @product, status: :created }
          else
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if @product.update(product_params)
            format.json { render :show, status: :ok, location: @product }
          else
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
          params.require(:product).permit(:title, :price, :released_at, :active)
        end
    end    
  end
end


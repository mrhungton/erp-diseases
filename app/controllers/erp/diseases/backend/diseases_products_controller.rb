module Erp
  module Diseases
    module Backend
      class DiseasesProductsController < Erp::Backend::BackendController
        def diseases_product_line_form
          @diseases_product = DiseasesProduct.new
          @diseases_product.product_id = params[:add_value]
          
          render partial: params[:partial], locals: {
            diseases_product: @diseases_product,
            uid: helpers.unique_id()
          }
        end
      end
    end
  end
end
  
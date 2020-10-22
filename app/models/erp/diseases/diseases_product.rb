module Erp::Diseases
  class DiseasesProduct < ApplicationRecord
    belongs_to :product, class_name: "Erp::Products::Product"
    belongs_to :disease, class_name: "Erp::Diseases::Disease"
    
    def product_name
      product.nil? ? '' : product.name
    end
    
    def product_code
      product.nil? ? '' : product.code
    end
    
    def product_price
      product.nil? ? '' : product.price
    end
    
    def disease_name
      disease.nil? ? '' : disease.name
    end
  end
end

Erp::Products::Product.class_eval do
  has_and_belongs_to_many :diseases, class_name: 'Erp::Diseases::Disease', :join_table => 'erp_diseases_diseases_products'
  
  def get_related_diseases()
    self.diseases
  end
end
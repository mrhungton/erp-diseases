class CreateErpDiseasesDiseasesProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_diseases_diseases_products do |t|
      t.references :disease, index: true, references: :erp_diseases_diseases
      t.references :product, index: true, references: :erp_products_products
    end
  end
end

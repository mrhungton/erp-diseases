class CreateErpDiseasesDiseases < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_diseases_diseases do |t|
      t.string :image
      t.string :name
      t.text :description
      t.text :definition
      t.text :reason
      t.text :symptoms
      t.text :treatment
      t.references :category, index: true, references: :erp_diseases_categories
      t.references :creator, index: true, references: :erp_users
      t.string :meta_keywords
      t.string :meta_description
      t.boolean :published, default: false
      t.integer :custom_order

      t.timestamps
    end
  end
end

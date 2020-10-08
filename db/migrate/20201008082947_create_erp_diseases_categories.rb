class CreateErpDiseasesCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :erp_diseases_categories do |t|
      t.string :name
      t.text :description
      t.integer :parent_id
      t.string :alias
      t.references :creator, index: true, references: :erp_users
      t.boolean :published, default: false
      t.integer :custom_order

      t.timestamps
    end
  end
end

class CreateFormBundles < ActiveRecord::Migration[5.2]
  def change
    create_table :form_bundles do |t|
      t.references :form, foreign_key: true, null: false
      t.references :document, foreign_key: true, null: false

      t.timestamps
    end
  end
end

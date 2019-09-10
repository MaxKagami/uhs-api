class CreateServiceMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :service_mappings do |t|
      t.references :document, foreign_key: true, null: false
      t.references :service, foreign_key: true, null: false

      t.timestamps
    end
  end
end

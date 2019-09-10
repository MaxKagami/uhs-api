class CreateDocumentGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :document_groups do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end

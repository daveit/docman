class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :docname
      t.string :deldoc
      t.string :lotnum
      t.string :custord
      t.date :docdate
      t.string :salesorder
      t.references :location, index: true
      t.references :product, index: true

      t.timestamps
    end
  end
end

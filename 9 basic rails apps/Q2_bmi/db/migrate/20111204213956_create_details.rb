class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :name
      t.float :height
      t.float :weight

      t.timestamps
    end
  end
end

class CreateLposts < ActiveRecord::Migration
  def change
    create_table :lposts do |t|
      t.belongs_to :lepost
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end

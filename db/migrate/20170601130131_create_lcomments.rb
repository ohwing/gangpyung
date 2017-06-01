class CreateLcomments < ActiveRecord::Migration
  def change
    create_table :lcomments do |t|
      t.belongs_to :lpost
      t.text :comment

      t.timestamps null: false
    end
  end
end

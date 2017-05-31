class CreateLeposts < ActiveRecord::Migration
  def change
    create_table :Leposts do |t|
      t.string :bbs_name

      t.timestamps null: false
    end
  end
end

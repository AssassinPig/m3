class CreateWorkContents < ActiveRecord::Migration
  def change
    create_table :work_contents do |t|
      t.string :title
      t.text :content
      t.string :work_pic_url
      t.string :work_logo_url

      t.timestamps
    end
  end
end

class CreateAboutContents < ActiveRecord::Migration
  def change
    create_table :about_contents do |t|
      t.string :title
      t.text :summary
      t.text :content

      t.timestamps
    end

  end
end

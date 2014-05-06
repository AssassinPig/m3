class CreateNewsContents < ActiveRecord::Migration
  def change
    create_table :news_contents do |t|
      t.string :title
      t.string :summary
      t.text :content
      t.string :news_pic_url

      t.timestamps
    end
  end
end

class NewsContent < ActiveRecord::Base
  mount_uploader :news_pic_url, NewsPicUrlUploader
end

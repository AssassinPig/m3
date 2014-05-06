class WorkContent < ActiveRecord::Base
  mount_uploader :work_pic_url, WorkPicUrlUploader
  mount_uploader :work_logo_url, WorkLogoUrlUploader
end

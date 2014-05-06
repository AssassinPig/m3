class Admin::StaticPagesController < Admin::ApplicationController
  def home
    if !login? 
      redirect_to admin_login_path
    end
  end

  def update_focus
    uploader = FocusPicUploader.new
    focus_pic=params[:focus_pic]
    uploader.store!(focus_pic)
    redirect_to admin_root_path
  end
end

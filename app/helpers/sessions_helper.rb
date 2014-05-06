module SessionsHelper
  def login(user) 
    cookies[:remember_token] = user.id 
    self.current_user = user
  end

  def login? 
    !current_user.nil?
  end

  def logout
    cookies.delete(:remember_token)
    self.current_user = nil 
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    if @current_user.nil? && cookies.key?(:remember_token)
      @current_user = User.find(cookies[:remember_token]) 
    end
    @current_user
  end
end

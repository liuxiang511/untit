class SiteController <  ApplicationController
  def index

  end
  def logout
    request.reset_session
    redirect_to root_path and return
  end
end
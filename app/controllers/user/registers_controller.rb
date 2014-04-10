class User::RegistersController < ApplicationController
  def index
  end
  def create
    firm_id  = 0
    u = User.new()
    if params[:firm_type].present?
      u.username = params[:firm_username]
      u.email = params[:firm_email]
      u.password = params[:firm_password]
      u.user_type = 1
      u.mobile = params[:firm_mobile] unless params[:firm_mobile].blank?
      u.phone = params[:firm_phone] unless params[:firm_phone].blank?
      if params[:firm_name].present?
        c = Concat.new
        c.name = params[:firm_link_man]
        c.mobile = params[:firm_mobile] unless params[:firm_mobile].blank?
        c.phone = params[:firm_phone] unless params[:firm_phone].blank?
        c.save
        f = FirmInfo.new
        f.firm_name = params[:firm_name]
        f.concat_id = c.id
        f.save
        firm_id = f.id
      end
      u.firm_info_id = firm_id unless firm_id == 0
    elsif params[:user_type_hide].present?
      u.username = params[:username]
      u.email = params[:email]
      u.password = params[:password]
      u.mobile = params[:mobile]
      u.user_type = 2
    end
    u.status = 1
    u.save
    render :json => {:success => true}
  end
  def ajax_validate_username
    user = User.find_by_username(params[:name])
    if user.present?
      render :json => {:success => false}
    else
      render :json => {:success => true}
    end
  end
  def ajax_validate_email
    user = User.find_by_email(params[:email])
    if user.present?
      render :json => {:success => false}
    else
      render :json => {:success => true}
    end
  end
  def ajax_validate_firm_name
    user = FirmInfo.find_by_firm_name(params[:name])
    if user.present?
      render :json => {:success => false}
    else
      render :json => {:success => true}
    end
  end

end



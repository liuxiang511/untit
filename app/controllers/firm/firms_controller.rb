# coding: utf-8
class Firm::FirmsController < ApplicationController
  layout  'firm'
  def index
    User.find_by(id:current_user.id)
    @firm = FirmInfo.find_by_id(current_user.firm_info_id)
    @photo = Photo.find_by(firm_info_id:current_user.firm_info_id,photo_type:'CORP_PIC')
  end
  def info_submit
    firm_info_id = current_user.firm_info_id

    if params[:doc].present?
      new_file_path = upload_file(params[:doc], "/public/images/firm_photo/")
      photo = Photo.find_by(firm_info_id:firm_info_id,photo_type:'CORP_PIC')
      if photo.blank?
        photo = Photo.new
        photo.firm_info_id = current_user.firm_info_id
        photo.photo_name = params[:doc].original_filename
        photo.photo_type = 'CORP_PIC'
        photo.photo_path = new_file_path
        photo.save
      else
        delete_file(RAILS_ROOT+'/public/images/firm_photo/'+photo.photo_path)
        photo.photo_path = new_file_path
        photo.save
      end
    end
    business_model = ''
    if params[:business_model].present?
      business_a = params[:business_model].to_a
      business_a.each_with_index do |a,i|
        if i != business_a.length-1
          business_model += (a[1].to_s+",")
        else
          business_model += (a[1].to_s)
        end
      end
    end
    params[:firm_info][:business_model] = business_model
    firm = FirmInfo.find_by_id(firm_info_id)
    firm.update (params[:firm_info])
    #firm.update(firm_name:params[:firm_info][:firm_name],province_id:params[:firm_info][:province_id],city_id:params[:firm_info][:city_id],district_id:params[:firm_info][:district_id],
    #            category:params[:firm_info][:category],firm_nature:params[:firm_info][:firm_nature],main_product:params[:firm_info][:main_product])
    redirect_to '/firm/firms'
  end
  def desc
    User.find_by(id:current_user.id)
    @firm = FirmInfo.find_by_id(current_user.firm_info_id)
  end
  def desc_submit
    firm_info_id = current_user.firm_info_id
    firm = FirmInfo.find_by_id(firm_info_id)
    firm.update (params[:firm_info])
    redirect_to '/firm/firms/desc'
  end
  def linker
    User.find_by(id:current_user.id)
    @photo = Photo.find_by(firm_info_id:current_user.firm_info_id,photo_type:'USER_PIC')
    @concat = FirmInfo.find_by_id(current_user.firm_info_id).concat
  end
  def linker_submit
    firm_info_id = current_user.firm_info_id
    if params[:doc].present?
      new_file_path = upload_file(params[:doc], "/public/images/user_photo/")
      photo = Photo.find_by(firm_info_id:firm_info_id,photo_type:'USER_PIC')
      if photo.blank?
        photo = Photo.new
        photo.firm_info_id = current_user.firm_info_id
        photo.photo_name = params[:doc].original_filename
        photo.photo_type = 'USER_PIC'
        photo.photo_path = new_file_path
        photo.save
      else
        delete_file(RAILS_ROOT+'/public/images/user_photo/'+photo.photo_path)
        photo.photo_path = new_file_path
        photo.save
      end
    end
    concat = FirmInfo.find_by_id(firm_info_id).concat
    concat.update (params[:concat])
    redirect_to '/firm/firms/linker'
  end
  def detail
    User.find_by(id:current_user.id)
    @firm = FirmInfo.find_by_id(current_user.firm_info_id)
  end
  def detail_submit
    firm_info_id = current_user.firm_info_id
    centify = ''
    if params[:centify].present?
      centify_a = params[:centify].to_a
      centify_a.each_with_index do |a,i|
        if i != centify_a.length-1
          centify += (a[1].to_s+",")
        else
          centify += (a[1].to_s)
        end
      end
    end
    params[:firm_info][:centify] = centify
    main_market = ''
    if params[:main_market].present?
      main_market_a = params[:main_market].to_a
      main_market_a.each_with_index do |a,i|
        if i != main_market_a.length-1
          main_market += (a[1].to_s+",")
        else
          main_market += (a[1].to_s)
        end
      end
    end
    params[:firm_info][:main_market] = main_market
    firm = FirmInfo.find_by_id(firm_info_id)
    firm.update (params[:firm_info])
    redirect_to '/firm/firms/detail'
  end
  def honor

  end
  def reset_pass
    
  end
  def get_cities_options
    opt_str = "<option value=''> 市</option>"
    City.find_all_by_cityUpId(params[:p_id]).each do |c|
      opt_str+="<option value='#{c.cityId}'>#{c.cityName}</option>"
    end
    render :text => opt_str
  end
  def get_district_options
    opt_str = "<option value=''> 区/县</option>"
    District.find_all_by_districtUpId(params[:c_id]).each do |c|
      opt_str+="<option value='#{c.districtId}'>#{c.districtName}</option>"
    end
    render :text => opt_str
  end
  def get_category_options
    opt_str = ""
    Category.find_all_by_parent_id(params[:cate_id].to_i).each do |c|
      opt_str+="<option value='#{c.id}'>#{c.name}</option>"
    end
    render :text => opt_str
  end

end
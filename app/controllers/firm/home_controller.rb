class Firm::HomeController < ApplicationController
  layout 'firm_main'
  def index
    @firm = FirmInfo.find_by_id(current_user.firm_info_id)
    @photo = Photo.find_by(firm_info_id:current_user.firm_info_id,photo_type:'USER_PIC')
    @concat = FirmInfo.find_by_id(current_user.firm_info_id).concat
  end
  def message
    params[:message].merge!(:firm_info_id => current_user.firm_info_id )
    Message.create(params[:message])
    @firm = FirmInfo.find_by_id(current_user.firm_info_id)
    @photo = Photo.find_by(firm_info_id:current_user.firm_info_id,photo_type:'USER_PIC')
    @concat = FirmInfo.find_by_id(current_user.firm_info_id).concat
    render action: 'index'
  end
end
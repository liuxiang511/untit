class Firm::HonestiesController < ApplicationController
  layout 'firm'
  def index


  end
  def license_add
    if params[:doc].present?
      new_file_path = upload_file(params[:doc], "/public/images/license/")
      photo = Photo.find_by(firm_info_id:current_user.firm_info_id,photo_type:'LICE_PIC')
      if photo.blank?
        photo = Photo.new
        photo.firm_info_id = current_user.firm_info_id
        photo.photo_name = params[:doc].original_filename
        photo.photo_type = 'LICE_PIC'
        photo.photo_path = new_file_path
        photo.save
      else
        delete_file(RAILS_ROOT+'/public/images/license/'+photo.photo_path)
        photo.photo_path = new_file_path
        photo.save
      end
      render '/firm/honesties/index'
    end
  end
end
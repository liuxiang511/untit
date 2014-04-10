class Firm::ProductsController < ApplicationController
  layout 'firm'
  def category
    @firm_category = FirmCategory.where(firm_info_id: current_user.firm_info_id,parent_id: 0).load
  end
  def category_add
    cate = params[:category]
    f_cate = FirmCategory.new
    f_cate.firm_info_id = current_user.firm_info_id
    f_cate.name = cate
    f_cate.parent_id = 0
    f_cate.save
    render :json => {:success => true,:cate_id => f_cate.id}
  end
  def category_delete
    f = FirmCategory.find_by_id(params[:id])
    if f.parent_id != 0
      f.destroy
    else
      f.destroy
      FirmCategory.where(parent_id: params[:id]).each do |t|
        t.destroy
      end
    end
    render :json => {:success => true}
  end
  def category_next
    ca = FirmCategory.where(parent_id: params[:parent_id]).to_json
    render :json => {:success => true, :source => ca}
  end
  def publish
    if params[:id].present?
      @product = Product.find(params[:id])
      @product_calculate = ProductCalculate.where(product_id:@product.id).load
      @photo = Photo.where(product_id:@product.id)

    end

  end
  def product_publish
    product_calculate = params[:product_calculate]
    product = params[:product]
    product.merge!(:firm_info_id => current_user.firm_info_id)
    product.merge!(:status => '2')
    product = Product.create(product)
    product_calculate.merge!(:product_id => product.id)
    ProductCalculate.create(product_calculate)
    if params[:doc].present?
      params[:doc].each do |d|
        new_file_path = upload_file(d[1], "/public/images/product_photo/")
        photo = Photo.new
        photo.firm_info_id = current_user.firm_info_id
        photo.photo_name = d[1].original_filename
        photo.photo_type = 'PRO_PIC'
        photo.photo_path = new_file_path
        photo.product_id = product.id
        photo.save
      end
    end
    render :action => 'publish'
  end
  def manage
    sql = 'firm_info_id = :firm_info_id'
    hash = {firm_info_id:current_user.firm_info_id}
    if params[:firm_category_id].present?
      sql += " and firm_category_id = :firm_category_id "
      hash.merge(firm_category_id:params[:firm_category_id])
    end
    if params[:title].present?
      sql += " and title like %:title% "
      hash.merge(title:params[:title])
    end
    if params[:status].present?
      sql += " and status = :status "
      hash.merge(status:params[:status])
    end
    @product = Product.where(sql,hash).order("created_at desc")
  end
  def pro_to_destroy
    Product.find(params[:id]).destroy
    render :json =>{:success => 'true'}

  end
end

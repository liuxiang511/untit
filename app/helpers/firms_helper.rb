module FirmsHelper
 def get_province
   Province.all.collect{|p| [p.provinceName, p.provinceId]} || []
 end
  def get_sys_code_option(type)
    SysCode.find_all_by_code_type(type).collect{|p| [p.value, p.code]} || []
  end
 def get_sys_code_value(code_type,code)
   SysCode.find_by(code_type:code_type,code:code).value
 end
 def get_firm_category()
   FirmCategory.find_all_by_firm_info_id(current_user.firm_info_id).collect{|p| [p.name, p.id]} || []
 end
  def get_category_step(step)
    return if step.blank?
    Category.find_all_by_cate_id(step.to_i).collect{|p| [p.name, p.id]} || []
  end
 def get_parent(category_id)
   return nil if category_id.blank?
   parent = [category_id.to_i]
   parent_1 = Category.find(category_id.to_i).parent_id
   if parent_1 == 0
     return parent
   else
     parent << parent_1
     parent_2 = Category.find(parent_1).parent_id
     if parent_2 == 0
       return parent
     else
       parent << parent_2
     end
   end
 end
 def get_category_name(id)
   Category.find(id).name
 end
  def get_city_name(city_id)
    city = City.find_by(cityId:city_id)
    city.present? ? city.cityName : nil
  end
  def get_district_name(district_id)
    district = District.find_by(districtId:district_id)
    district.present? ? district.districtName : nil
  end
end

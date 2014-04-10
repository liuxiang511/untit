# encoding: utf-8
class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  helper_method :logged_in?, :current_user
  helper :all # include all helpers, all the time
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def logged_in?
    current_user.present?
  end
  def current_user
    @current_user ||= acquire_current_user
  end
  def upload_file(file, path, new_filename=nil) #处理上传后的文件保存
    return nil if file.blank?
    path = RAILS_ROOT + path
    path+="/" unless path.end_with?("/")
    FileUtils.mkdir_p(path) unless File.exist?(path)
    unless file.original_filename.empty?
      #生成一个随机的文件名
      new_filename = Time.now.strftime("%Y-%m-%d %H:%M:%S").gsub(":", "-").gsub(" ", "-")+"-#{rand(10000)}" + "." + get_extname(file.original_filename) if new_filename.blank?
      #向dir目录写入文件
      File.open("#{path+new_filename}", "wb") do |f|
        f.write(file.read)
      end
      #返回文件名称
      new_filename
    end
  end
  def delete_file(path)
    return nil if path.blank?
    File.delete(path) if File.exists?(path)
  end
  def get_extname(filename) #获取文件名
    unless filename.blank?
      if filename =~ /\.(\w+)$/m
        $1
      else
        ""
      end
    end
  end
  private
  def acquire_current_user
    User.send :find_by_id, session[:user_id]
  end
end

class CreateTableCorpInfo < ActiveRecord::Migration
  def change
    create_table :firm_infos do |t|
      t.integer :concat_id
      t.string :firm_name
      t.string :category #行业类别
      t.string :firm_nature #公司性质
      t.string :business_model #经营模式
      t.string :web #公司主页
      t.integer :province_id #省
      t.integer :city_id  #市
      t.integer :district_id #区
      t.string :address #具体地址
      t.string :firm_owner #法人代表
      t.integer :owner_card_id #法人代表省份证
      t.date :found_at #成立时间
      t.integer :staff_count
      t.float :found_capital #注册资本
      t.string :found_bank #开户银行
      t.integer :bank_card_id #开户银行账号
      t.string :brand #品牌
      t.float :turnover #年营业额
      t.string :centify #管理体系认证
      t.string :quality_control #质量控制
      t.integer :photo_id #营业执照
      t.string :OEM_centify #OEM认证
      t.string :desc #描述
      t.timestamps
    end
    add_index :firm_infos, :concat_id, :unique => true
    add_index :firm_infos, :firm_name, :unique => true
    add_index :firm_infos, :web, :unique => true
    add_index :firm_infos, :brand, :unique => true
  end
end

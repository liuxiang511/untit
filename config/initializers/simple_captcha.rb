redis = Redis.new host: '127.0.0.1', port: 6379

redis = Redis::Namespace.new('express:captcha', redis: redis)
SimpleCaptcha.setup do |sc|
  # default: 100x28
  sc.image_size = '120x40'

  # default: 5
  sc.length = 3

  # default: simply_blue
  # possible values:
  # 'embosed_silver',
  # 'simply_red',
  # 'simply_green',
  # 'simply_blue',
  # 'distorted_black',
  # 'all_black',
  # 'charcoal_grey',
  # 'almost_invisible'
  # 'random'
  sc.image_style = 'simply_green'
  sc.tmp_path = '/tmp'
  sc.image_magick_path = 'F:\imagpick\ImageMagick-6.8.8-Q16' # you can check this from console by running: which convert
  # default: low
  # possible values: 'low', 'medium', 'high', 'random'
  sc.distortion = 'medium'
end
SimpleCaptcha.setup do |sc|
  # default: 100x28
  sc.image_size = '120x30'

  # default: 5
  sc.length = 6

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
  sc.image_style = 'ruby_blog'

  # default: low
  # possible values: 'low', 'medium', 'high', 'random'
  sc.distortion = 'medium'
end

module SimpleCaptcha #:nodoc
  module ImageHelpers
    @@image_styles = {'ruby_blog' => ['-shade 80x65', '-background "#e8e8e8"']}
  end
  module ViewHelper #:nodoc

    private
    def generate_simple_captcha_data(code)
      value = ''
      case code
        when 'numeric' then
          SimpleCaptcha.length.times { value << (48 + rand(10)).chr }
        when 'mixing' then
          SimpleCaptcha.length.times { value << [(48 + rand(10)),(65 + rand(26))][rand(2)].chr }
        else
          SimpleCaptcha.length.times { value << (65 + rand(26)).chr }
      end
      value
    end
  end
end
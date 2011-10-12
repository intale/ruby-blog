# encoding: utf-8

module RusAlpha
  RUS_ALPHAS = {"а" => "a", "б" => "b", "в" => "v", "г" => "g", "д" => "d", "е" => "e", "ё" => "e", "ж" => "j",
                "з" => "z", "и" => "i", "к" => "k", "л" => "l", "м" => "m", "н" => "n", "о" => "o", "п" => "p",
                "р" => "r", "с" => "s", "т" => "t", "у" => "u", "ф" => "f", "х" => "h", "ц" => "ts", "ч" => "ch",
                "ш" => "sh", "щ" => "sch", "ь" => "'", "ъ" => "'", "э" => "e", "ю" => "yu", "я" => "ya"}

  def self.translate(string)
    string.gsub(/./){|s| RUS_ALPHAS.has_key?(s) ? RUS_ALPHAS[s] : s}
  end

end
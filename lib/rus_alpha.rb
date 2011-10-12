# encoding: utf-8

module RusAlpha
  RUS_ALPHAS = {"а" => "a", "б" => "b", "в" => "v", "г" => "g", "д" => "d", "е" => "e", "ё" => "e", "ж" => "j",
                "з" => "z", "и" => "i", "й" => "y" ,"к" => "k", "л" => "l", "м" => "m", "н" => "n", "о" => "o", "п" => "p",
                "р" => "r", "с" => "s", "т" => "t", "у" => "u", "ф" => "f", "х" => "h", "ц" => "ts", "ч" => "ch",
                "ш" => "sh", "щ" => "sch", "э" => "e", "ю" => "yu", "я" => "ya", "ь" => "", "ъ" => ""}

  def self.translate(string)
    string.gsub(/./){|s| s = downcase_rus(s); RUS_ALPHAS.has_key?(s) ? RUS_ALPHAS[s] : s}
  end

  private

  def self.downcase_rus(rus_symbol)
    if rus_symbol =~ /[А-Я|Ё]/
      (rus_symbol == "Ё" ? rus_symbol.ord + 80 : rus_symbol.ord + 32).chr
    else
      rus_symbol
    end
  end

end
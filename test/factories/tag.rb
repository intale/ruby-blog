Factory.define :tag do |f|
    f.sequence(:name) { |n| "div_#{n}" }
end
Factory.define :admin, :class => Admin do |f|
    f.username 'Petrov'
    f.nick 'shark'
    f.email 'shark@mail.ru'
    f.password "qwerty"
    f.password_confirmation {|u| u.password}
end

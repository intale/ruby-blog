Factory.define :admin, :class => Admin do |f|
    f.username {"Petrov #{SecureRandom.hex(10)}"}
    f.nick {"sharks #{SecureRandom.hex(10)}"}
    f.email {"shark#{SecureRandom.hex(2)}@mail.ru"}
    f.password "qwerty"
    f.password_confirmation {|u| u.password}
end

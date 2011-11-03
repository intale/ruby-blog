Factory.define :post, :class => Post do |f|
    f.subject 'subject'
    f.tags {|tags| [tags.association(:tag)]}
    f.association :admin_id, :factory => :admin, :method => :build
    f.message '<html><head></head><body><div><f>bla bla</div></body></html></f>'
end

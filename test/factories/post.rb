Factory.define :post, :class => Post do |f|
    f.subject 'subject'
    f.association :admin_id, :factory => :admin, :method => :build
    f.message 'grshshjhsrhs'
end

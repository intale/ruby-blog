Factory.define :comment do |f|
    f.content 'content'
    f.association :post_id, :factory => :post, :method => :build
    f.author { 'gdhgj' }
end
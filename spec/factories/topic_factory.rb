Factory.define :topic do |e|
  e.title "Tópico Básico"
  e.body "Lorem ipsum dolor sit amet, consectetur magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation"
  e.sequence(:view_count){ |n| n }
end


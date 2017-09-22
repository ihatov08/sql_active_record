categories = YAML.load_file("#{Rails.root}/db/yml/categories.yml")
categories.each do |category|
  Category.seed do |s|
    s.id   = category['id']
    s.name = category['name']
  end
end
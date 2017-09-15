exercises = YAML.load_file("#{Rails.root}/db/yml/exercises.yml")
exercises.each do |exercise|
  Exercise.seed do |s|
    s.id = exercise['id']
    s.title = exercise['title']
    s.table_name = exercise['table_name']
  end
end

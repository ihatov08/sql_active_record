exercises = YAML.load_file("#{Rails.root}/db/yml/exercises.yml")
exercises.each do |exercise|
  Exercise.seed do |s|
    s.id = exercise['id']
    s.title = exercise['title']
    s.active_record_query = exercise['active_record_query']
    s.sql = exercise['sql']
    s.table_name = exercise['table_name']
    s.category_id = exercise['category_id']
  end
end

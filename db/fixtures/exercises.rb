Exercise.seed do |s|
  s.id =       1
  s.title =    'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = MoneyBook.select(:item, :recieve, :pay).to_sql
  s.category_id = 1
end

Exercise.seed do |s|
  s.id =  2
  s.title =  'タイトルどうしよう'
  s.table_name =  'money_books'
  s.active_record_query =  MoneyBook.select("item AS '費目'", "receive AS '入金額'", "pay AS 出金額").to_sql
  s.category_id =  1
end

Exercise.seed do |s|
  s.id = 3
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = MoneyBook.where('pay > ?', 1000).to_sql
  s.category_id = 2
end

Exercise.seed do |s|
  s.id =  4
  s.title =  'タイトルどうしよう'
  s.table_name =  'money_books'
  s.active_record_query =  MoneyBook.where(pay: nil).to_sql
  s.category_id =  2
end

Exercise.seed do |s|
  s.id = 5
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = MoneyBook.where('pay IS NULL').to_sql
  s.category_id = 2
end

Exercise.seed do |s|
  s.id =  6
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = MoneyBook.where("memo LIKE ?", "%1月%").to_sql
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 7
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = MoneyBook.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight).to_sql
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 8
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = MoneyBook.where(pay: 1000..10000).to_sql
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 9
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = MoneyBook.where(item: %w(食費 光熱費)).to_sql
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 10
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = MoneyBook.where("pay > ANY ('{?}')", [1000, 2000, 3000]).to_sql
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 11
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = MoneyBook.where("pay > ALL ('{?}')", [1000,2000,3000]).to_sql
  s.category_id = 2
end

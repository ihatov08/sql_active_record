Exercise.seed do |s|
  s.id =       1
  s.title =    'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = <<~SQL
    MoneyBook.select(:item, :recieve, :pay)
  SQL
  s.category_id = 1
end

Exercise.seed do |s|
  s.id =  2
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = <<~SQL
      MoneyBook.select("item AS 費目", "receive AS 入金額", "pay AS 出金額")
  SQL
  s.category_id =  1
end

Exercise.seed do |s|
  s.id = 3
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = <<~SQL
    MoneyBook.where('pay > ?', 1000)
    SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id =  4
  s.title =  'タイトルどうしよう'
  s.table_name =  'money_books'
  s.active_record_query = <<~SQL
    MoneyBook.where(pay: nil)
    SQL
  s.category_id =  2
end

Exercise.seed do |s|
  s.id = 5
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = <<~SQL
    MoneyBook.where('pay IS NULL')
    SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id =  6
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = <<~SQL
    MoneyBook.where("memo LIKE ?", "%1月%")
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 7
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = <<~SQL
    MoneyBook.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 8
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = <<~SQL
    MoneyBook.where(pay: 1000..10000)
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 9
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = <<~SQL
    MoneyBook.where(item: %w(食費 光熱費))
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 10
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = <<~SQL
    MoneyBook.where("pay > ANY ('{?}')", [1000, 2000, 3000])
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 11
  s.title = 'タイトルどうしよう'
  s.table_name = 'money_books'
  s.active_record_query = <<~SQL
    MoneyBook.where("pay > ALL ('{?}')", [1000,2000,3000])
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 12
  s.title = 'タイトルどうしよう'
  s.table_name = 'cities'
  s.active_record_query = <<~SQL
    City.where('population > 10000').where(countrycode: 'JPN')
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 13
  s.title = 'タイトルどうしよう'
  s.table_name = 'cities'
  s.active_record_query = <<~SQL
    City.select(:name).where('population >= 10000').where(countrycode: 'JPN')
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 14
  s.title = 'タイトルどうしよう'
  s.table_name = 'cities'
  s.active_record_query = <<~SQL
    City.where(id: 1)
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 15
  s.title = 'タイトルどうしよう'
  s.table_name = 'cities'
  s.active_record_query = <<~SQL
    City.all
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 16
  s.title = 'タイトルどうしよう'
  s.table_name = 'cities'
  s.active_record_query = <<~SQL
    City.where('countrycode = ?', 'JPN')
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 17
  s.title = 'タイトルどうしよう'
  s.table_name = 'cities'
  s.active_record_query = <<~SQL
    City.select(:name).where(countrycode: 'JPN')
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 18
  s.title = 'タイトルどうしよう'
  s.table_name = 'stations'
  s.active_record_query = <<~SQL
    Station.select(:city, :state)
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 19
  s.title = 'タイトルどうしよう'
  s.table_name = 'stations'
  s.active_record_query = <<~SQL
    Station.select(:name).where('id %2 = 0').distinct
  SQL
  s.category_id = 2
end

Exercise.seed do |s|
  s.id = 19
  s.title = 'タイトルどうしよう'
  s.table_name = 'stations'
  s.active_record_query = <<~SQL
    Station.select('COUNT(name) - COUNT(DISTINCT name)')
  SQL
  s.category_id = 2
end
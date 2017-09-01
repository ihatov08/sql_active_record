class Exercise < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :body
    validates :answer
  end

  def check?(ar_sql)
    sql = Exercise.find_by_sql(title)
    # クラス名固定なのでstringで受け取れるようにしたほうがいいか
    ar_sql = Exercise.class_eval(ar_sql)

    if ar_sql.respond_to?(:to_a)
      ar_sql = ar_sql.to_a
    else
      ar_sql = [ar_sql]
    end
    sql == ar_sql
  end
end

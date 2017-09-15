class Exercise < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :answer
    validates :sql
  end

  # ar_sql => "Exercise.all" 文字列で渡ってくる
  # table_name => exercises
  # table_name.classify.constantize => Exercise
  # table_name.constantize.class_eval(string_activerecord_query)
  def check?(string_activerecord_query)
    model_class = table_name.classify.constantize
    generate_sql_by_active_record =
      model_class
        .readonly
        .class_eval(string_activerecord_query)
        .to_sql

    if sql == generate_sql_by_active_record
      true
    else
      generate_sql_by_active_record
    end

    # find, find_by使うとactive_record_relationで返ってこない
    # 返ってくるレコードが同じか判定したい場合は、↓コードを使う
    # if activerecord_relation.respond_to?(:to_a)
    #   activerecord_relation = activerecord_relation.to_a
    # else
    #   activerecord_relation = [activerecord_relation]
    # end
    # sql == activerecord_relation
  end
end

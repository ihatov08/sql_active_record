class Exercise < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :sql
    validates :active_record_query
  end

  belongs_to :category

  before_save :set_sql

  # ar_sql => "Exercise.all" 文字列で渡ってくる
  # table_name => exercises
  # table_name.classify.constantize => Exercise
  # table_name.constantize.class_eval(string_activerecord_query)
  def check?(string_activerecord_query)
    ar_query = generate_sql_by_acitive_record_query(string_activerecord_query)
    if sql == ar_query
      true
    else
      ar_query
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

  private

  def model_class
    table_name.classify.constantize
  end

  def generate_sql_by_acitive_record_query(string)
    model_class
      .readonly
      .class_eval(string)
      .to_sql
  end

  def set_sql
    self.sql = generate_sql_by_acitive_record_query(active_record_query)
  end
end

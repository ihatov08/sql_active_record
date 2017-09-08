class Answer < ApplicationRecord
  belongs_to :exercise

  enum kind: { default: 0, sql: 1, active_record: 2 }
end

class Exercise < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :body
    validates :answer
  end
end

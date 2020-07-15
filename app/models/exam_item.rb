class ExamItem < ApplicationRecord
  belongs_to :exam
  belongs_to :exercise
end

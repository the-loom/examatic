class Exercise < ApplicationRecord
  include HasDifficulty

  has_rich_text :wording
  has_rich_text :solution

  has_many :exam_items
  has_many :exams, through: :exam_items

  acts_as_taggable_on :tags

  def readable_id
    "E" + id.to_s.rjust(3, "0")
  end
end

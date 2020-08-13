class Exam < ApplicationRecord
  has_many :exam_items
  has_many :exercises, through: :exam_items

  validates_presence_of :title, :exam_date, :exercises

  def readable_id
    "X" + id.to_s.rjust(3, "0")
  end

  def tags
    exercises.map { |e| e.tags }.flatten.uniq
  end

  def tags_with_count
    exercises
        .map { |e| e.tags }
        .flatten
        .inject(Hash.new(0)) { |total, e| total[e] += 1; total}
        .sort { |x, y| y[1] <=> x[1] }
  end
end

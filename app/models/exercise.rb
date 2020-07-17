class Exercise < ApplicationRecord
  include HasDifficulty

  has_rich_text :wording
  has_rich_text :solution

  has_many :exam_items
  has_many :exams, through: :exam_items

  belongs_to :origin, class_name: "Exercise", optional: true

  acts_as_taggable_on :tags

  validates_presence_of :wording, :tag_list

  def readable_id
    "E#{id.to_s.rjust(3, "0")}.#{version}"
  end

  def dup
    super.tap do |object|
      object.wording = wording.dup
      object.wording.record_id = nil

      object.solution = solution.dup
      object.solution.record_id = nil

      object.tag_list = tag_list
    end
  end
end

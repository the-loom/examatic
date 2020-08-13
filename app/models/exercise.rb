class Exercise < ApplicationRecord
  include HasDifficulty
  include Discard::Model

  has_rich_text :wording
  has_rich_text :solution

  has_many :exam_items
  has_many :exams, through: :exam_items

  belongs_to :origin, class_name: "Exercise", optional: true

  acts_as_taggable_on :tags

  validates_presence_of :wording, :tag_list
  validates :internal_id, uniqueness: { scope: :version }

  scope :last_versions, -> {
    joins("inner join (select internal_id, max(version) as version from exercises group by internal_id) e2 on exercises.internal_id = e2.internal_id and exercises.version = e2.version")
  }
  scope :sorted, -> { order(:internal_id) }
  scope :with_dependencies, -> { includes([:rich_text_solution, :rich_text_wording, :tag_taggings, :tags]) }

  def readable_id
    "E#{internal_id.to_s.rjust(3, "0")}.#{version}"
  end

  def toggle_flagged!
    self.flagged = !self.flagged
    save!
  end

  def numerate
    self.internal_id = Exercise.maximum(:internal_id) + 1
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

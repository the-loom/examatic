module HasDifficulty
  MAX = 3

  def self.included(base)
    base.class_eval do
      validates_presence_of :difficulty
      validates :difficulty, inclusion: { in: 1..3, message: "must be between 1 and 3" }

      scope :easy, -> { where(difficulty: 1) }
      scope :medium, -> { where(difficulty: 2) }
      scope :hard, -> { where(difficulty: 3) }
    end
  end
end

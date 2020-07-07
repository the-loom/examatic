class Exercise < ApplicationRecord
  has_rich_text :wording
  has_rich_text :solution

  acts_as_taggable_on :tags

  def readable_id
    "E" + id.to_s.rjust(3, "0")
  end
end

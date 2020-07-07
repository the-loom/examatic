class Exercise < ApplicationRecord
  has_rich_text :wording
  has_rich_text :solution

  acts_as_taggable_on :tags
end

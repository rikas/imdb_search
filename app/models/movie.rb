class Movie < ApplicationRecord
  include PgSearch::Model
  belongs_to :director

  multisearchable against: [:title, :synopsis]

  pg_search_scope :search_by_title_and_synopsis,
    against: {
      title: 'B',
      synopsis: 'A'
    },
    using: {
      tsearch: { prefix: true }
    }
end

class Loutre < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_event, against: [:event], using: { tsearch: { prefix: true } }
end

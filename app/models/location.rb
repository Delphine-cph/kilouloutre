class Location < ApplicationRecord
  belongs_to :user
  belongs_to :loutre
  validates :status, default: false
end

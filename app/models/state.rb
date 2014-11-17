class State < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: [:slugged, :finders]
  has_many :counties

  validates_presence_of :name, :state_id, :slug
  validates :abbreviation, length: { in: 2..3 }	
  validates :fips, length: { is: 5 }
  validates :country, inclusion: { in: %w(US), message: "%{value} is not a valid country code" } 

  before_validation(on: :create) do
    self.fips = self.state_id.to_s.rjust(2, '0') + "000"
  end

end

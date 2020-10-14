class TripRecord < ActiveRecord::Base

  # attr_accessor :site_id
  belongs_to :site

  #callback
  before_save :set_and_calculate_revenue

  private

  def set_and_calculate_revenue
    site = Site.find(self.site_id)
    self.revenue = (((self.distance-1) * site.lnt_leading_charge.to_i) + site.lnt_basic_charge) * self.truck_capacity * self.trip_count
  end

end

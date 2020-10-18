class TripRecord < ActiveRecord::Base

  # attr_accessor :site_id
  belongs_to :site

  #callback
  before_save :set_and_calculate_revenue

  private

  def set_and_calculate_revenue
    site = Site.find(self.site_id)
    if self.excavation_done && self.loading_and_trasportaion_done
      self.revenue = (((self.distance-1) * site.lnt_leading_charge.to_i) + site.lnt_basic_charge + site.excavation_charges ) * self.truck_capacity * self.trip_count
    end
    if self.excavation_done == true && self.loading_and_trasportaion_done == false
        self.revenue = site.excavation_charges * self.truck_capacity * self.trip_count
    end
    if self.excavation_done == false && self.loading_and_trasportaion_done == true
        self.revenue = (((self.distance-1) * site.lnt_leading_charge.to_i) + site.lnt_basic_charge) *  self.truck_capacity * self.trip_count
    end
  end

end

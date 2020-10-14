module TripRecordsHelper

  def calculate_revenue
    # binding.pry
  end

  def calculate_diesel_price(diesel_quatity, diesel_price)
    diesel_quatity * diesel_price
  end

  def calculate_amount_left(revenue, diesel_price)
    revenue - diesel_price
  end

end

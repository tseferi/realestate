class AddServiceRefToAmenities < ActiveRecord::Migration[5.0]
  def change
    add_reference :amenities, :service, foreign_key: true
  end
end

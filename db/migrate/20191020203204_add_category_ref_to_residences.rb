class AddCategoryRefToResidences < ActiveRecord::Migration[5.0]
  def change
    add_reference :residences, :category, foreign_key: true
  end
end

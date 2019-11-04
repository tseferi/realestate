class Residence < ApplicationRecord
  belongs_to :category, touch: true
  after_touch do
    puts 'A residence was touched'
  end

  validates :title, length: {is: 5}
  # validates :description, length: {minimum: 25}
  validates :available, inclusion: [true, false]
  validates :unit, length: {is: 4}
  validates :rent, length: { within: 4..6 }

   validates :description, length: {minimum: 25,  
     too_short: "Description must be at least %{count} words"}

  validates_each :title, :description do |category, attr, value|
    category.errors.add(attr, 'must start with upper case')if
        value =~ /\ A [[:lower:]]/
  end


end
class Residence < ApplicationRecord
  belongs_to :category, touch: true
  after_touch do
    puts 'A residence was touched'
  end

  validates :title, length: {is: 5}
  validates :description, length: {minimum: 25}
  validates :available, length: {minimum: 1}
  validates :unit, length: {is: 4}
  validates :rent, length: {in: 4..6}

  validates_each :title, :description do |category, attr, value|
    category.errors.add(attr, 'must start with upper case')if
        value =~ /\ A [[:lower:]]/
  end
  validates_each :description do|category, attr, value|
    if words < 24
      category.errors.add(attr, 'description must be at least 25 words')
    end
  end
end
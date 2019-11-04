require 'rails_helper'
require 'rspec/rails'

# RSpec.describe Residence, :type => :model do
#   it 'is valid with valid attributes' do
#     expect(Residence.new).to be_valid
#   end
  # it 'is not valid without a title' do
  #   Residence.new(:residence, title: nil)
  #   expect(Residence).to_not be_valid
  # end
  # it 'is not valid without a description' do
  #   Residence.new(description: true)
  #   expect(Residence).to_not be_valid
  # end
  # it 'is not valid without a start_date' do
  #   Residence.new(start_date: nil)
  #   expect(Residence).to_not be_valid
  # end
  # it 'is not valid without a end_date' do
  #   Residence.new(end_date: nil)
  #   expect(Residence).to_not be_valid
  # end
# end
RSpec.describe Residence, type: :model do
  # it 'validates presence'do
  #   record = Residence.new
  #   record.category_id
  #   record.title = ' ' #invalid state
  #   record.valid? #run validations
  #   record.errors[:title]= :should, include("can't be blank")

  #   record.title = 'Something'
  #   record.valid?
  #   record.errors[:title]= :should_not, include("can't be blank")

  #   record.description = 'aaaa'
  #   record.valid?
  #   record.errors[:description]= :should, include("description must be at least 25 words")
  # end

  context "validations" do

    before do 
      Category.create(title: "Category1")
    end

    subject { Residence.new(
              title: "Name1", 
              description: "description" * 4, 
              available: true, unit: 1234, rent: 542, category_id: Category.first.id) }

    it { expect(subject).to be_valid }
    it { expect(subject.title.length).to eq(5)}
    it { expect(subject.description.length).to be > 25}
    it { expect(subject.available).to_not be_nil}
    it { expect(subject.unit).to_not be_nil}
    it { expect(subject.rent).to_not be < 6}
    # it { expect(subject.tit).to_not be_nil }
  end

end



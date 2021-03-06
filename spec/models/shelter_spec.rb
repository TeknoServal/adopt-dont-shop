require 'rails_helper'

describe Shelter, type: :model do
  describe 'validations' do
    it do
      should validate_presence_of :name
      should validate_presence_of :address
      should validate_presence_of :city
      should validate_presence_of :state
      should validate_presence_of :zip
    end
  end

  describe 'relationships' do
    it do
       should have_many :pets
       should have_many :reviews
    end
  end
end

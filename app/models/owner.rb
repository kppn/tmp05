class Owner < ActiveRecord::Base
  has_many :cars
  has_one :user
end

class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer, presence: true
  validates :color, presence: true
  validates :year, presence: true
  validates :year, numericality: {only_integer: true, greater_than_or_equal_to: 1920}
  validates :mileage, presence: true
  validates :mileage, numericality: {only_integer: true}
end

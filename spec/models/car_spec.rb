require "rails_helper"

describe Car do
  it {should belong_to :manufacturer}
  
  it {should have_valid(:manufacturer).when(Manufacturer.new)}
  it {should_not have_valid(:manufacturer).when(nil)}

  it {should have_valid(:color).when("Blue")}
  it {should_not have_valid(:color).when(nil, "")}

  it {should have_valid(:year).when(1996)}
  it {should_not have_valid(:year).when(nil, "", 1919)}

  it {should have_valid(:mileage).when(100000)}
  it {should_not have_valid(:mileage).when(nil, "")}
end
